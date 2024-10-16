import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomExceptionHandler implements Exception {
  final String message;
  CustomExceptionHandler(this.message);

  @override
  String toString() => message;
}

// No Internet Connection Exception
class NoInternetException extends CustomExceptionHandler {
  NoInternetException() : super("No internet connection available.");
}

// User not found Auth Exception
class UserNotFoundAuthException extends CustomExceptionHandler {
  UserNotFoundAuthException() : super("User not found");
}

// Auth Exception
class AuthException extends CustomExceptionHandler {
  AuthException(super.message);
}

// Data Not Found Exception
class DataNotFoundException extends CustomExceptionHandler {
  DataNotFoundException() : super("Data not found.");
}

// Document ID Not Null Exception
class DocumentPathNotEmptyException extends CustomExceptionHandler {
  DocumentPathNotEmptyException() : super("Document ID should not be empty.");
}

// File Upload Canceled
class FileUploadCanceledException extends CustomExceptionHandler {
  FileUploadCanceledException() : super("File upload was canceled.");
}

// File Upload Error
class FileUploadErrorException extends CustomExceptionHandler {
  FileUploadErrorException() : super("Error uploading the file.");
}

// Generic Error
class AuthGenericException extends AuthException {
  AuthGenericException(super.message);
}

/// example usage
class Example {
  Future getUserData(String docId) async {
    try {
      if (docId.isEmpty) {
        throw DocumentPathNotEmptyException(); // Handle custom document not found case
      }
      DocumentSnapshot document = await FirebaseFirestore.instance.collection('users').doc(docId).get();
      if (!document.exists) {
        throw DataNotFoundException(); // Handle custom data not found case
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException(); // Handle custom user not found case
      } else {
        throw AuthException(e.message ?? "An unknown authentication error occurred."); // Handle custom generic auth exception
      }
    } on FirebaseException catch (e) {
      if (e.code == 'canceled') {
        throw FileUploadCanceledException(); // Throw custom upload canceled exception
      } else {
        throw FileUploadErrorException(); // Custom exception for file upload errors
      }
    } on SocketException {
      throw NoInternetException(); // throw no internet exception
    } catch (e) {
      throw AuthGenericException("Unknown Exception $e"); // throw Generic exception
    }
  }
}
