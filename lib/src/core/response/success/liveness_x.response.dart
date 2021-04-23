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

  factory LivenessXResponse.fromJson(Map<String, dynamic> json) {
    return LivenessXResponse(
      base64: json['base64'],
      processID: json['processID'],
      log: json['log'],
      isLiveness: json['isLiveness'],
    );
  }
}
