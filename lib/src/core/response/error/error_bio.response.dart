class ErrorBioResponse {
  late int code;
  late String method;
  late String description;

  ErrorBioResponse(Map<dynamic, dynamic> map) {
    code = map['code'];
    method = map['method'];
    description = map['description'] ?? map['result'];
  }
}
