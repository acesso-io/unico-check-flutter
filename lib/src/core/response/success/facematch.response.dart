import 'package:unico_check/src/core/constants/map.constants.dart';

class FacematchResponse {
  final bool status;

  const FacematchResponse({
    required this.status,
  });

  factory FacematchResponse.fromJson(Map<String, dynamic> json) {

    if(json[MapConstants.result] != null){
      return FacematchResponse(
        status: json[MapConstants.result],
      );
    }else{
      var statusIOS = false;
      if(json['Status'] == 1){
        statusIOS = true;
      }
      return FacematchResponse(
        status: statusIOS,
      );
    }
  }
}

bool statusFromJson(dynamic status) => status == 1 || status;


