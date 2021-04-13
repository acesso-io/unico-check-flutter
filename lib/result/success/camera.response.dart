import 'package:json_annotation/json_annotation.dart';

part 'camera.response.g.dart';

@JsonSerializable()
class CameraResponse {
  final String base64;
  final String processID;
  const CameraResponse({required this.base64, required this.processID});

  factory CameraResponse.fromJson(Map<String, dynamic> json) =>
      _$CameraResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CameraResponseToJson(this);
}
