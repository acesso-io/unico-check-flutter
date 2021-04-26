import 'package:unico_check/src/core/constants/map.constants.dart';

class FacematchResponse {
  final String base64Selfie;
  final String base64Document;
  final bool status;

  const FacematchResponse({
    required this.base64Selfie,
    required this.base64Document,
    required this.status,
  });

  factory FacematchResponse.fromJson(Map<String, dynamic> json) {

    if(json[MapConstants.result] != null){
      return FacematchResponse(
        base64Selfie: "",
        base64Document: "",
        status: json[MapConstants.result],
      );
    }else{
      var statusIOS = false;
      if(json['Status'] == 1){
        statusIOS = true;
      }
      return FacematchResponse(
        base64Selfie: json['Base64Selfie'],
        base64Document: json['Base64Document'],
        status: statusIOS,
      );
    }
  }
}

bool statusFromJson(dynamic status) => status == 1 || status;


