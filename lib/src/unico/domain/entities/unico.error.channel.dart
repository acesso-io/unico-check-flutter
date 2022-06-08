class UnicoErrorChannel {
  late int? code;
  late String? description;
  late String? methodName;
  static const String unicoError = "unicoError";
  static const String map_code = "code";
  static const String map_description = "description";
  static const String errorMethod = "errorMethodName";

  UnicoErrorChannel(int? code, String? description, String? methodName) {
    this.code = code;
    this.description = description;
    this.methodName = methodName;
  }
}
