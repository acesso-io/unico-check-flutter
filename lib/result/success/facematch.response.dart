import 'package:json_annotation/json_annotation.dart';

part 'facematch.response.g.dart';

@JsonSerializable()
class FacematchResponse {
  final String base64Selfie;
  final String base64Document;

  @JsonKey(fromJson: statusFromJson)
  final bool status;

  const FacematchResponse({
    required this.base64Selfie,
    required this.base64Document,
    required this.status,
  });

  factory FacematchResponse.fromJson(Map<String, dynamic> json) =>
      _$FacematchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FacematchResponseToJson(this);
}

bool statusFromJson(dynamic status) {
  if (status == 1) {
    return true;
  } else if (status == true) {
    return status;
  }

  return false;
}
