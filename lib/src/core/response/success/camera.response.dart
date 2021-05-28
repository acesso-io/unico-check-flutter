class CameraResponse {
  final String base64;
  final String processID;
  const CameraResponse({required this.base64, required this.processID});

  factory CameraResponse.fromJson(Map<String, dynamic> json){

    if(json['processID'] != null){
      return CameraResponse(base64: json['base64'], processID: json['processID']);
    }else{
      return CameraResponse(base64: json['base64'], processID: json['processId']);
    }

  }
}
