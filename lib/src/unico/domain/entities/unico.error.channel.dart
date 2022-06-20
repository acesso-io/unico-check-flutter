class UnicoErrorChannel {
  late int? code;
  late String? description;
  late String? methodName;
  static const String unicoError = "unicoError";
  static const String mapCode = "code";
  static const String mapDescription = "description";
  static const String errorMethod = "errorMethodName";

  UnicoErrorChannel(this.code, this.description, this.methodName);
}
