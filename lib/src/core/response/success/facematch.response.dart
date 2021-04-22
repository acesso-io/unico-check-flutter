class FacematchResponse {
  final String base64Selfie;
  final String base64Document;
  final bool status;

  const FacematchResponse({
    required this.base64Selfie,
    required this.base64Document,
    required this.status,
  });

  factory FacematchResponse.fromJson(Map<String, dynamic> json) {
    return FacematchResponse(
      base64Selfie: json['base64Selfie'],
      base64Document: json['base64Document'],
      status: statusFromJson(json['status']),
    );
  }
}

bool statusFromJson(dynamic status) {
  if (status == 1) {
    return true;
  } else if (status == true) {
    return status;
  }

  return false;
}
