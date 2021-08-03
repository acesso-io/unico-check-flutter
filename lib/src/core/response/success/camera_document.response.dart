class CameraDocumentResponse {
  final String base64;

  const CameraDocumentResponse({required this.base64});

  factory CameraDocumentResponse.fromJson(Map<String, dynamic> json) {
    if (json['result'] == null) {
      return CameraDocumentResponse(base64: json['base64']);
    } else {
      return CameraDocumentResponse(base64: json['result']);
    }
  }
}
