class UnicoError {
  late int code;
  late String description;
  static const String map_code = "code";
  static const String map_description = "description";

  UnicoError(int code, String description) {
    this.code = code;
    this.description = description;
  }
}
