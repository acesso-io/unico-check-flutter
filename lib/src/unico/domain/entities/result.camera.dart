class ResultCamera {
  late String? base64;
  late String? encrypted;
  static const String map_base64 = "base64";
  static const String map_encrypted = "encrypted";

  ResultCamera(String? base64, String? encrypted) {
    this.base64 = base64;
    this.encrypted = encrypted;
  }
}
