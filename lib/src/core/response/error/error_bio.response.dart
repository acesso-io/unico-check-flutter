class ErrorBioResponse {
  /// codigo do erro
  late int code;
  /// método do erro
  late String method;
  /// descrição do erro
  late String description;

  ErrorBioResponse(Map<dynamic, dynamic> map) {
    if(map['description'] == null || map['description'] == ""){
      description = map['result'];
    }else{
      code = map['code'];
      method = map['method'];
      description = map['description'];
    }
  }

}
