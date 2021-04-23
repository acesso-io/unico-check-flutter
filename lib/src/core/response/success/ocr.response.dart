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

  factory OCRResponse.fromJson(Map<String, dynamic> json) {
    return OCRResponse(
      birthDate: json['BirthDate'],
      placeOfBirth: json['PlaceOfBirth'],
      category: json['Category'],
      expeditionCity: json['ExpeditionCity'],
      expeditionState: json['ExpeditionState'],
      expeditionDate: json['ExpeditionDate'],
      expirationDate: json['ExpirationDate'],
      fatherName: json['FatherName'],
      motherName: json['MotherName'],
      firstLicenseDate: json['FirstLicenseDate'],
      name: json['Name'],
      rg: json['RG'],
      code: json['Code'],
      registrationNumber: json['RegistrationNumber'],
      renach: json['Renach'],
      securityCode: json['SecurityCode'],
      mirrorNumber: json['MirrorNumber'],
      observation: json['Observation'],
    );
  }
}
