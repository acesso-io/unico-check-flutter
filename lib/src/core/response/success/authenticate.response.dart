class AuthenticateResponse {
  final String base64;
  final bool status;
  final bool isLiveness;

  const AuthenticateResponse({
    required this.base64,
    required this.status,
    required this.isLiveness,
  });

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) {

    if(json['result'] != null){
      return AuthenticateResponse(
        base64: '',
        status: json['result'],
        isLiveness: json['result'],
      );
    }else{
      return AuthenticateResponse(
        base64: json['base64'],
        status: json['status'],
        isLiveness: json['isLiveness'],
      );
    }


  }
}
