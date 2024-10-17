import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:galleon_user/helper/database_helper/database_synonyms.dart';
import 'package:galleon_user/helper/database_helper/firebase_error_messages.dart';
import 'package:galleon_user/helper/storage_handler/storage_data_handler.dart';

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
        errorMessage = FirebaseErrorMessages.somethingWantWrong;
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
      return FirebaseResponseModel(isSuccess: false, data: null, errorMessage: FirebaseErrorMessages.somethingWantWrong);
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
}
