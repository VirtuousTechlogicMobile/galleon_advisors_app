import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:galleon_user/helper/database_helper/database_synonyms.dart';
import 'package:galleon_user/helper/database_helper/firebase_error_messages.dart';
import 'package:galleon_user/helper/storage_handler/storage_data_handler.dart';
import 'package:galleon_user/modules/create_new_position/model/position_data_model.dart';
import 'package:galleon_user/modules/create_new_position/model/program_data_model.dart';
import 'package:galleon_user/modules/create_new_study/model/department_data_model.dart';
import 'package:galleon_user/modules/create_new_study/model/opportunity_flag_data_model.dart';
import '../custom_exception_handler.dart';
import 'firebase_response_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  static DatabaseHelper get instance => _instance;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<FirebaseResponseModel<String?>> signInUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        // store data in Storage
        await StorageDataHandler.setUserUid(uid: userCredential.user?.uid ?? '');
        String? userRole = await getUserRoleById(userCredential.user?.uid);
        return FirebaseResponseModel(isSuccess: true, data: userRole, errorMessage: null);
      } else {
        return FirebaseResponseModel(isSuccess: false, data: null, errorMessage: FirebaseErrorMessages.userNotFound);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'invalid-email' || e.code == 'wrong-password' || e.code == 'invalid-credential') {
        errorMessage = FirebaseErrorMessages.wrongEmailOrPassword;
      } else if (e.code == 'user-not-found') {
        errorMessage = FirebaseErrorMessages.userNotFound;
      } else {
        errorMessage = FirebaseErrorMessages.somethingWentWrong;
      }
      return FirebaseResponseModel(isSuccess: false, data: null, errorMessage: errorMessage);
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      throw AuthException("An authentication error occurred while Sign In. $e");
    }
  }

  Future<String?> getUserRoleById(String? userId) async {
    try {
      DocumentSnapshot documentSnapshot = await fireStoreInstance.collection(DatabaseSynonyms.usersCollection).doc(userId).get();

      if (documentSnapshot.exists) {
        final docData = documentSnapshot.data() as Map<String, dynamic>;
        return docData[DatabaseSynonyms.roleField];
      } else {
        return null;
      }
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      throw DataNotFoundException();
    }
  }

  Future<FirebaseResponseModel> logoutUser() async {
    try {
      await StorageDataHandler.deleteAllData();
      await firebaseAuth.signOut();
      return FirebaseResponseModel(isSuccess: true, data: null, errorMessage: null);
    } on FirebaseAuthException {
      return FirebaseResponseModel(isSuccess: false, data: null, errorMessage: FirebaseErrorMessages.somethingWentWrong);
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      throw GenericException("An authentication error occurred while Sign In. $e");
    }
  }

  Future<FirebaseResponseModel> sendPasswordResetEmail({required String email}) async {
    try {
      if (await checkEmailExists(email)) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        return FirebaseResponseModel(isSuccess: true, data: null, errorMessage: null);
      } else {
        return FirebaseResponseModel(isSuccess: false, data: null, errorMessage: FirebaseErrorMessages.emailNotExists);
      }
    } catch (e) {
      throw AuthException("An authentication error occurred while Sign In. $e");
    }
  }

  Future<bool> checkEmailExists(String email) async {
    try {
      QuerySnapshot querySnapshot = await fireStoreInstance.collection(DatabaseSynonyms.usersCollection).where(DatabaseSynonyms.emailField, isEqualTo: email).get();
      return querySnapshot.docs.isNotEmpty;
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      throw GenericException("An unknown error occurred: $e");
    }
  }

  Future<FirebaseResponseModel<List<ProgramDataModel>?>> getAllProgramsData() async {
    try {
      CollectionReference programCollectionRef = fireStoreInstance.collection(DatabaseSynonyms.programCollection);

      List<ProgramDataModel> programsList = [];

      QuerySnapshot querySnapshot = await programCollectionRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        programsList.addAll(querySnapshot.docs.map((docs) => ProgramDataModel.fromMap(docs.data() as Map<String, dynamic>, programId: docs.id)).toList());
      }
      return FirebaseResponseModel(
        isSuccess: true,
        data: programsList.isNotEmpty ? programsList : null,
        errorMessage: null,
      );
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      log("Exception : $e");
      throw DataNotFoundException();
    }
  }

  Future<FirebaseResponseModel<List<DepartmentDataModel>?>> getProgramDepartmentData({required List<String> departmentIds}) async {
    try {
      CollectionReference deptCollectionRef = fireStoreInstance.collection(DatabaseSynonyms.departmentCollection);

      List<DepartmentDataModel> deptList = [];

      for (var id in departmentIds) {
        DocumentSnapshot snapshot = await deptCollectionRef.doc(id).get();
        if (snapshot.exists) {
          deptList.add(DepartmentDataModel.fromMap(snapshot.data() as Map<String, dynamic>, departmentId: snapshot.id));
        }
      }
      /* QuerySnapshot querySnapshot = await deptCollectionRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        deptList.addAll(querySnapshot.docs.map((docs) => DepartmentDataModel.fromMap(docs.data() as Map<String, dynamic>, departmentId: docs.id)).toList());
      }*/
      if (deptList.isNotEmpty) {
        return FirebaseResponseModel(
          isSuccess: true,
          data: deptList.isNotEmpty ? deptList : null,
          errorMessage: null,
        );
      } else {
        return FirebaseResponseModel(
          isSuccess: false,
          data: deptList.isNotEmpty ? deptList : null,
          errorMessage: FirebaseErrorMessages.dataNotFound,
        );
      }
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      log("Exception : $e");
      throw DataNotFoundException();
    }
  }

  Future<FirebaseResponseModel<List<PositionDataModel>?>> getPositionsDataById({String? departmentIds}) async {
    try {
      CollectionReference positionCollectionRef = fireStoreInstance.collection(DatabaseSynonyms.positionsCollection);

      List<PositionDataModel> positionList = [];

      QuerySnapshot querySnapshot = await positionCollectionRef.where(DatabaseSynonyms.departmentIdField, isEqualTo: departmentIds).get();
      if (querySnapshot.docs.isNotEmpty) {
        positionList.addAll(querySnapshot.docs.map((docs) => PositionDataModel.fromMap(docs.data() as Map<String, dynamic>, positionId: docs.id)).toList());
      }

      return FirebaseResponseModel(
        isSuccess: true,
        data: positionList.isNotEmpty ? positionList : null,
        errorMessage: null,
      );
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      log("Exception : $e");
      throw DataNotFoundException();
    }
  }

  Future createStudy() async {}

  Future<void> insertOppFlagsData(OpportunityFlagDataModel position) async {
    try {
      CollectionReference positionsRef = fireStoreInstance.collection(DatabaseSynonyms.opportunityFlagCollection);
      DocumentReference ref = await positionsRef.add(position.toMap());
      print("Program inserted successfully!   ${ref.id}");
    } catch (e) {
      print("Error inserting program: $e");
    }
  }

  Future<void> updateTaskIds() async {
    try {
      List<String> taskIds = [
        "DoknS8YdAOfSA0ddBWAS",
        "SWt5ilpwfPbBuSVeFAVR",
        "VSUCPMi9rsBYS2amJoQC",
        "DY40oSGZP7yBCsrXEgK2",
        "K701kEUqZzhR0SNGKNnG",
        "DdeQQZtngaqQk5MRUYMb",
      ];
      // Update the 'tasksIds' field in the specific document
      await fireStoreInstance.collection('positions').doc('KeFvnEDxYw1294nnwK4m').update({
        'tasks_ids': taskIds,
      });
      print("tasksIds updated successfully");
    } catch (e) {
      print("Error updating tasksIds: $e");
    }
  }
}
