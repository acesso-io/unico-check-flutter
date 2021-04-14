// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OCRResponse _$OCRResponseFromJson(Map<String, dynamic> json) {
  return OCRResponse(
    birthDate: json['birthDate'] as String,
    placeOfBirth: json['placeOfBirth'] as String,
    category: json['category'] as String,
    expeditionCity: json['expeditionCity'] as String,
    expeditionState: json['expeditionState'] as String,
    expeditionDate: json['expeditionDate'] as String,
    expirationDate: json['expirationDate'] as String,
    fatherName: json['fatherName'] as String,
    motherName: json['motherName'] as String,
    firstLicenseDate: json['firstLicenseDate'] as String,
    name: json['name'] as String,
    rg: json['rg'] as String,
    code: json['code'] as String,
    registrationNumber: json['registrationNumber'] as String,
    renach: json['renach'] as String,
    securityCode: json['securityCode'] as String,
    mirrorNumber: json['mirrorNumber'] as String,
    observation: json['observation'] as String,
  );
}

Map<String, dynamic> _$OCRResponseToJson(OCRResponse instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate,
      'placeOfBirth': instance.placeOfBirth,
      'category': instance.category,
      'expeditionCity': instance.expeditionCity,
      'expeditionState': instance.expeditionState,
      'expeditionDate': instance.expeditionDate,
      'expirationDate': instance.expirationDate,
      'fatherName': instance.fatherName,
      'motherName': instance.motherName,
      'firstLicenseDate': instance.firstLicenseDate,
      'name': instance.name,
      'rg': instance.rg,
      'code': instance.code,
      'registrationNumber': instance.registrationNumber,
      'renach': instance.renach,
      'securityCode': instance.securityCode,
      'mirrorNumber': instance.mirrorNumber,
      'observation': instance.observation,
    };
