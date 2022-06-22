import 'package:unico_check/src/unico/domain/entities/unico.config.dart';

class UnicoConfigMapper {
  Map<dynamic, dynamic> map(UnicoConfig unicoConfig) {
    return <dynamic, dynamic>{
      'project_number': unicoConfig.getProjectNumber,
      'project_id': unicoConfig.getProjectId,
      'mobile_sdk_app_id': unicoConfig.getMobileSdkAppId,
      'bundle_identifier': unicoConfig.getBundleIdentifier,
      'host_info': unicoConfig.getHostInfo,
      'host_Key': unicoConfig.getHostKey
    };
  }
}
