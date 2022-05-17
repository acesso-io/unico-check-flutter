class CameraResult {
  late String? _base64;
  late String? _encrypted;
  static const String key_base64 = "base64";
  static const String key_encrypted = "encrypted";

  ResultCamera(String? base64, String? encrypted) {
    this._base64 = base64;
    this._encrypted = encrypted;
  }
}
