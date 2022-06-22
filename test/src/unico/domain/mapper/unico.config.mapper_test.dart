import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.config.mapper.dart';
import 'package:unico_check/unico_check.dart';

import '../../../test_dummy.dart';

void main() {
  late UnicoConfigMapper mapper;

  setUp(() {
    mapper = UnicoConfigMapper();
  });

  test('should map UnicoConfig whwn call map method', () {
    final UnicoConfig unicoConfig = UnicoConfig(
      getBundleIdentifier: dummyString,
      getHostInfo: dummyString,
      getHostKey: dummyString,
      getMobileSdkAppId: dummyString,
      getProjectId: dummyString,
      getProjectNumber: dummyString,
    );

    final result = mapper.map(unicoConfig);

    expect(result['bundle_identifier'], unicoConfig.getBundleIdentifier);
    expect(result['host_info'], unicoConfig.getHostInfo);
    expect(result['host_Key'], unicoConfig.getHostKey);
    expect(result['mobile_sdk_app_id'], unicoConfig.getMobileSdkAppId);
    expect(result['project_id'], unicoConfig.getProjectId);
    expect(result['project_number'], unicoConfig.getProjectNumber);
  });
}
