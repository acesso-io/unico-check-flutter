import 'package:unico_check/src/clean/domain/entities/unico.config.dart';

class OpenCameraRequest {
  late UnicoConfig _unicoConfig;
  late String _jsonFileName;
  late bool _autoCaptrue = true;
  late bool _smartFrame = true;

  void setUnicoConfig(UnicoConfig unicoConfig) {
    _unicoConfig = unicoConfig;
  }

  void setJsonFilneName(String jsonFileName) {
    _jsonFileName = jsonFileName;
  }

  void setAutoCaptrue(bool autoCaptrue) {
    _autoCaptrue = autoCaptrue;
  }

  void setSmartFrame(bool smartFrame) {
    _smartFrame = smartFrame;
  }

  Map<dynamic, dynamic> get getOpenCameraRequest {
    return <dynamic, dynamic>{
      'json_file_name': _jsonFileName,
      'unico_config': _unicoConfig.getCommonMap,
      'disable_auto_capture': _autoCaptrue,
      'disable_smart_frame': _smartFrame
    };
  }
}
