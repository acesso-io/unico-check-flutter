class ErrorBioResponse {
  int? code;
  String? method;
  String? description;

  ErrorBioResponse(Map<dynamic, dynamic> map) {
    // TODO: Como utilizar o json serializable na description? Ela vem de duas fontes diferentes
    code = map['code'];
    method = map['method'];
    description = map['description'] ?? map['result'];
  }
}
