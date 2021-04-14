import 'package:json_annotation/json_annotation.dart';

part 'liveness_x.response.g.dart';

@JsonSerializable()
class LivenessXResponse {
  final String base64;
  final String processID;
  final String log;
  final bool isLiveness;

  const LivenessXResponse({
    required this.base64,
    required this.processID,
    required this.log,
    required this.isLiveness,
  });

  factory LivenessXResponse.fromJson(Map<String, dynamic> json) =>
      _$LivenessXResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LivenessXResponseToJson(this);
}
