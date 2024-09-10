import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.environment.mapper.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.locale.types.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/document.type.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.environment.dart';
import 'package:unico_check/src/unico/domain/entities/unico.locale.types.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/open.camera.request.mapper.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.config.mapper.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.theme.mapper.dart';

class MockUnicoThemeMapper extends Mock implements UnicoThemeMapper {}

class MockUnicoConfigMapper extends Mock implements UnicoConfigMapper {}

class FakeUnicoConfig extends Mock implements UnicoConfig {}

void main() {
  late UnicoThemeMapper unicoThemeMapper;
  late UnicoConfigMapper unicoConfigMapper;
  late UnicoLocaleTypesMapper unicoLocaleTypesMapper;
  late UnicoEnvironmentMapper unicoEnvironmentMapper;
  late OpenCameraRequestMapper mapper;

  setUp(() {
    unicoThemeMapper = MockUnicoThemeMapper();
    unicoConfigMapper = MockUnicoConfigMapper();
    unicoLocaleTypesMapper = UnicoLocaleTypesMapper();
    unicoEnvironmentMapper = UnicoEnvironmentMapper();
    
    mapper = OpenCameraRequestMapper(unicoThemeMapper, unicoConfigMapper, unicoLocaleTypesMapper, unicoEnvironmentMapper);
  });

  test('should map to OpenCameraRequest when call map method', () {
    final UnicoTheme unicoTheme = UnicoTheme();
    final UnicoConfig unicoConfig = FakeUnicoConfig();
    const UnicoLocaleTypes unicoLocaleType = UnicoLocaleTypes.PT_BR;
    const UnicoEnvironment unicoEnvironment = UnicoEnvironment.DEV;
    final Map<dynamic, dynamic> mapped = {};
    final OpenCameraRequest request = OpenCameraRequest()
      ..setUnicoConfigAndroid(unicoConfig)
      ..setUnicoConfigIos(unicoConfig)
      ..setAutoCaptrue(true)
      ..setDocumentType(DocumentType.CNH)
      ..setSmartFrame(true)
      ..setTimeoutSession(1)
      ..setUnicoTheme(unicoTheme)
      ..setLocaleTypes(unicoLocaleType)
      ..setEnvironment(unicoEnvironment);

    when(() => unicoThemeMapper.map(unicoTheme))
        .thenAnswer((invocation) => mapped);
    when(() => unicoConfigMapper.map(unicoConfig))
        .thenAnswer((invocation) => mapped);

    final result = mapper.map(request);

    expect(result['unico_theme'], mapped);
    expect(result['set_auto_capture'], request.autoCapture);
    expect(result['set_smart_frame'], request.smartFrame);
    expect(result['set_timeout_session'], request.timeoutSession);
    expect(result['document_type'], DocumentType.CNH.name);
    expect(result['unico_config_ios'], mapped);
    expect(result['unico_config_android'], mapped);
  });
}
