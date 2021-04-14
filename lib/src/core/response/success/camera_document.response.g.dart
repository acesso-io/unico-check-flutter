// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_document.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraDocumentResponse _$CameraDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return CameraDocumentResponse(
    base64: json['result'] as String,
  );
}

Map<String, dynamic> _$CameraDocumentResponseToJson(
        CameraDocumentResponse instance) =>
    <String, dynamic>{
      'result': instance.base64,
    };
