class FirebaseResponseModel<T> {
  final bool isSuccess;
  final T? data;
  final String? errorMessage;

  FirebaseResponseModel({
    required this.isSuccess,
    this.data,
    this.errorMessage,
  });
}
