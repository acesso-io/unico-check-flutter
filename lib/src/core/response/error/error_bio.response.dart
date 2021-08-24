class ErrorBioResponse {
  /// codigo do erro
  late int code;

  /// método do erro
  late String method;

  /// descrição do erro
  late String description;

  ErrorBioResponse(Map<dynamic, dynamic> map) {
    code = map['code'];
    method = map['method'];

    if (map['desc'] == null) {
      description = map['description'];
    } else {
      description = map['desc'];
    }
  }
}
