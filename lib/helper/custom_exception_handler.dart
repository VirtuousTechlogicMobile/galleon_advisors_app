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

// Generic Exception
class GenericException extends CustomExceptionHandler {
  GenericException(super.message);
}

// Data Not Found Exception
class DataNotFoundException extends CustomExceptionHandler {
  DataNotFoundException() : super("Data not found.");
}

// Document ID Not Null Exception
class DocumentPathNotEmptyException extends CustomExceptionHandler {
  DocumentPathNotEmptyException() : super("Document ID should not be empty.");
}

// File Upload Error
class FileUploadErrorException extends CustomExceptionHandler {
  FileUploadErrorException() : super("Error uploading the file.");
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
      throw AuthException(e.message ?? "An unknown authentication error occurred."); // Handle custom generic auth exception
    } on FirebaseException catch (e) {
      throw FileUploadErrorException();
    } on SocketException {
      throw NoInternetException(); // throw no internet exception
    } catch (e) {
      throw AuthException("Unknown Exception $e"); // throw Generic exception
    }
  }
}
