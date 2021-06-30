class ErrorBioResponse {
  late int code;
  late String method;
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
