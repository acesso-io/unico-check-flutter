import 'package:json_annotation/json_annotation.dart';

part 'camera_document.response.g.dart';

@JsonSerializable()
class CameraDocumentResponse {
  @JsonKey(name: 'result')
  final String base64;

  const CameraDocumentResponse({required this.base64});

  factory CameraDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$CameraDocumentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CameraDocumentResponseToJson(this);
}
