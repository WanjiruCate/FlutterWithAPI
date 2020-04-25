class ApiResponse<T> {
  T data;
  bool error;
  String errorMessage;

  ApiResponse({this.data, this.errorMessage, this.error = false});
}
