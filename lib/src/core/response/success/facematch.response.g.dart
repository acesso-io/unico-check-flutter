// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facematch.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacematchResponse _$FacematchResponseFromJson(Map<String, dynamic> json) {
  return FacematchResponse(
    base64Selfie: json['base64Selfie'] as String,
    base64Document: json['base64Document'] as String,
    status: statusFromJson(json['status']),
  );
}

Map<String, dynamic> _$FacematchResponseToJson(FacematchResponse instance) =>
    <String, dynamic>{
      'base64Selfie': instance.base64Selfie,
      'base64Document': instance.base64Document,
      'status': instance.status,
    };
