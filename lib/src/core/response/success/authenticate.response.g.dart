// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateResponse _$AuthenticateResponseFromJson(Map<String, dynamic> json) {
  return AuthenticateResponse(
    base64: json['base64'] as String,
    status: json['status'] as bool,
    isLiveness: json['isLiveness'] as bool,
  );
}

Map<String, dynamic> _$AuthenticateResponseToJson(
        AuthenticateResponse instance) =>
    <String, dynamic>{
      'base64': instance.base64,
      'status': instance.status,
      'isLiveness': instance.isLiveness,
    };
