/// Configure your credentials
class UnicoConfig {
  final String? getProjectNumber;
  final String? getProjectId;
  final String? getMobileSdkAppId;
  final String getBundleIdentifier;
  final String? getHostInfo;
  final String getHostKey;

  UnicoConfig({
    this.getProjectNumber,
    this.getProjectId,
    this.getMobileSdkAppId,
    required this.getBundleIdentifier,
    this.getHostInfo,
    required this.getHostKey,
  });
}
