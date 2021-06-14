class CameraResponse {
  final String base64;

  const CameraResponse({required this.base64});

  factory CameraResponse.fromJson(Map<String, dynamic> json){
    if(json['result'] != null){
      return CameraResponse(base64: json['result']);
    }else{
      return CameraResponse(base64: json['base64']);
    }

  }
}
