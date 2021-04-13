import 'package:json_annotation/json_annotation.dart';

part 'ocr.response.g.dart';

@JsonSerializable()
class OCRResponse {
  final String birthDate;
  final String placeOfBirth;
  final String category;
  final String expeditionCity;
  final String expeditionState;
  final String expeditionDate;
  final String expirationDate;
  final String fatherName;
  final String motherName;
  final String firstLicenseDate;
  final String name;
  final String rg;
  final String code;
  final String registrationNumber;
  final String renach;
  final String securityCode;
  final String mirrorNumber;
  final String observation;

  const OCRResponse({
    required this.birthDate,
    required this.placeOfBirth,
    required this.category,
    required this.expeditionCity,
    required this.expeditionState,
    required this.expeditionDate,
    required this.expirationDate,
    required this.fatherName,
    required this.motherName,
    required this.firstLicenseDate,
    required this.name,
    required this.rg,
    required this.code,
    required this.registrationNumber,
    required this.renach,
    required this.securityCode,
    required this.mirrorNumber,
    required this.observation,
  });

  factory OCRResponse.fromJson(Map<String, dynamic> json) =>
      _$OCRResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OCRResponseToJson(this);
}
