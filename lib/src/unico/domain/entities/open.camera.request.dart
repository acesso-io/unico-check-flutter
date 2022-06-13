import 'package:unico_check/src/unico/domain/entities/document.type.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

class OpenCameraRequest {
  late UnicoTheme _unicoTheme;
  late bool _autoCapture = true;
  late bool _smartFrame = true;
  late double _timeoutSession;
  late DocumentType _documentType = DocumentType.NONE;
  late UnicoConfig _unicoConfigIos;
  late UnicoConfig _unicoConfigAndroid;

  void setUnicoTheme(UnicoTheme unicoTheme) {
    _unicoTheme = unicoTheme;
  }

  void setAutoCaptrue(bool autoCaptrue) {
    _autoCapture = autoCaptrue;
  }

  void setSmartFrame(bool smartFrame) {
    _smartFrame = smartFrame;
  }

  void setTimeoutSession(double timeoutSession) {
    _timeoutSession = timeoutSession;
  }

  void setDocumentType(DocumentType documentType) {
    _documentType = documentType;
  }

  void setUnicoConfigIos(UnicoConfig unicoConfigIos) {
    _unicoConfigIos = unicoConfigIos;
  }

  void setUnicoConfigAndroid(UnicoConfig unicoConfigAndroid) {
    _unicoConfigAndroid = unicoConfigAndroid;
  }

  Map<dynamic, dynamic> get getOpenCameraRequest {
    return <dynamic, dynamic>{
      'unico_theme': _unicoTheme.getCommonMap,
      'set_auto_capture': _autoCapture,
      'set_smart_frame': _smartFrame,
      'set_timeout_session': _timeoutSession,
      'document_type': _documentType.name,
      'unico_config_ios': _unicoConfigIos.getCommonMap,
      'unico_config_android': _unicoConfigAndroid.getCommonMap
    };
  }
}
