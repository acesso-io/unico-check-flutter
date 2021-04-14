// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraResponse _$CameraResponseFromJson(Map<String, dynamic> json) {
  return CameraResponse(
    base64: json['base64'] as String,
    processID: json['processID'] as String,
  );
}

Map<String, dynamic> _$CameraResponseToJson(CameraResponse instance) =>
    <String, dynamic>{
      'base64': instance.base64,
      'processID': instance.processID,
    };
