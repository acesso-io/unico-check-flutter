// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liveness_x.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivenessXResponse _$LivenessXResponseFromJson(Map<String, dynamic> json) {
  return LivenessXResponse(
    base64: json['base64'] as String,
    processID: json['processID'] as String,
    log: json['log'] as String,
    isLiveness: json['isLiveness'] as bool,
  );
}

Map<String, dynamic> _$LivenessXResponseToJson(LivenessXResponse instance) =>
    <String, dynamic>{
      'base64': instance.base64,
      'processID': instance.processID,
      'log': instance.log,
      'isLiveness': instance.isLiveness,
    };
