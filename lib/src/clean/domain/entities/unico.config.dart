class UnicoConfig {
  late String _getProjectNumber;
  late String _getProjectId;
  late String _getMobileSdkAppId;
  late String _getBundleIdentifier;
  late String _getHostInfo;
  late String _getHostKey;

  UnicoConfig({
    required String getProjectNumber,
    required String getProjectId,
    required String getMobileSdkAppId,
    required String getBundleIdentifier,
    required String getHostInfo,
    required String getHostKey,
  }){
    _getProjectNumber = getProjectNumber;
    _getProjectId = getProjectId;
    _getMobileSdkAppId = getMobileSdkAppId;
    _getBundleIdentifier = getBundleIdentifier;
    _getHostInfo = getHostInfo;
    _getHostKey = getHostKey;
  }

  Map<dynamic, dynamic> get getCommonMap {
    return <dynamic, dynamic>{
      'project_number': _getProjectNumber,
      'project_id': _getProjectId,
      'mobile_sdk_app_id': _getMobileSdkAppId,
      'bundle_identifier': _getBundleIdentifier,
      'host_info': _getHostInfo,
      'host_Key': _getHostKey
    };
  }
}
