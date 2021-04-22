class CameraDocumentResponse {
  final String base64;
  const CameraDocumentResponse({required this.base64});

  factory CameraDocumentResponse.fromJson(Map<String, dynamic> json) {
    return CameraDocumentResponse(base64: json['result']);
  }
}
