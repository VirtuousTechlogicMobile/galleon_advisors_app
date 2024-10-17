import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        /// store data in Storage
        await StorageDataHandler.setUserUid(uid: userCredential.user?.uid ?? '');
        print("logged in ");
        return FirebaseResponseModel(isSuccess: true, data: null, errorMessage: null);
      } else {
        print("user not found");
        return FirebaseResponseModel(isSuccess: false, data: null, errorMessage: FirebaseErrorMessages.userNotFound);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'invalid-email' || e.code == 'wrong-password') {
        errorMessage = FirebaseErrorMessages.wrongEmailOrPassword;
      } else if (e.code == 'user-not-found') {
        errorMessage = FirebaseErrorMessages.userNotFound;
      } else {
        errorMessage = FirebaseErrorMessages.somethingWantWrong;
      }
      return FirebaseResponseModel(
        isSuccess: false,
        data: null,
        errorMessage: errorMessage,
      );
    } on SocketException {
      throw NoInternetException();
    } catch (e) {
      throw AuthException("An authentication error occurred while Sign In. $e");
    }
  }
}
