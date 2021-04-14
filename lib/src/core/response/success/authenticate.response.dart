import 'package:json_annotation/json_annotation.dart';

part 'authenticate.response.g.dart';

@JsonSerializable()
class AuthenticateResponse {
  final String base64;
  final bool status;
  final bool isLiveness;

  const AuthenticateResponse({
    required this.base64,
    required this.status,
    required this.isLiveness,
  });

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateResponseToJson(this);
}
