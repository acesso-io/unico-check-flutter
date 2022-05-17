import 'package:unico_check/unico_check.dart';

class RequestOpenCamera {
  late UnicoConfig configUnico;
  late String _unicoConfigFileName;
  late bool _cameraAutoCapture;
  late bool _cameraSmartFrame;

  void setConfigUnico(UnicoConfig configUnico) {
    configUnico = configUnico;
  }

  void setConfigUnicoFileName(String unicoConfigFileName) {
    _unicoConfigFileName = unicoConfigFileName;
  }

  void setCameraAutoCapture(bool cameraAutoCapture) {
    _cameraAutoCapture = cameraAutoCapture;
  }

  void setCameraSmartFrame(bool cameraSmartFrame) {
    _cameraSmartFrame = cameraSmartFrame;
  }

  Map<dynamic, dynamic> get requestGETOpenCamera {
    return <dynamic, dynamic>{
      "unico_file_name": _unicoConfigFileName,
      "unico_config": configUnico,
      "disable_auto_capture": _cameraAutoCapture,
      "disable_smart_frame": _cameraSmartFrame,
    };
  }
}
