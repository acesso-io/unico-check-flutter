import 'package:unico_check/src/unico/adapter/repository/mappers/unico.config.mapper.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.environment.mapper.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.locale.types.mapper.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.theme.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';

class OpenCameraRequestMapper {
  final UnicoThemeMapper unicoThemeMapper;
  final UnicoConfigMapper unicoConfigMapper;
  final UnicoLocaleTypesMapper unicoLocaleTypesMapper;
  final UnicoEnvironmentMapper unicoEnvironmentMapper;

  OpenCameraRequestMapper(this.unicoThemeMapper, this.unicoConfigMapper,
      this.unicoLocaleTypesMapper, this.unicoEnvironmentMapper);

  Map<dynamic, dynamic> map(OpenCameraRequest request) {
    Map<dynamic, dynamic> unicoTheme = request.unicoTheme != null
        ? unicoThemeMapper.map(request.unicoTheme!)
        : {};

    Map<dynamic, dynamic> unicoConfigIos = request.unicoConfigIos != null
        ? unicoConfigMapper.map(request.unicoConfigIos!)
        : {};

    Map<dynamic, dynamic> unicoConfigAndroid =
        request.unicoConfigAndroid != null
            ? unicoConfigMapper.map(request.unicoConfigAndroid!)
            : {};

    String unicoLocaleTypes = request.unicoLocaleTypes != null
        ? unicoLocaleTypesMapper.map(request.unicoLocaleTypes!)
        : "PT_BR";

    String unicoEnvironment = request.unicoEnvironment != null
        ? unicoEnvironmentMapper.map(request.unicoEnvironment!)
        : "PROD";

    return <dynamic, dynamic>{
      'unico_theme': unicoTheme,
      'set_auto_capture': request.autoCapture,
      'set_smart_frame': request.smartFrame,
      'set_timeout_session': request.timeoutSession,
      'set_locale_types': unicoLocaleTypes,
      'set_environment': unicoEnvironment,
      'document_type': request.documentType.name,
      'unico_config_ios': unicoConfigIos,
      'unico_config_android': unicoConfigAndroid,
    };
  }
}
