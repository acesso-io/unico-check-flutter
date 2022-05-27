import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/entities/unico.theme.dart';

class OpenCameraRequest {
  late UnicoTheme _unicoTheme;
  late String _jsonFileName;
  late bool _autoCapture = true;
  late bool _smartFrame = true;
  late double _timeoutSession;
  late DocumentType _documentType = DocumentType.NONE;
  late UnicoConfig _unicoConfig;

  void setUnicoTheme(UnicoTheme unicoTheme) {
    _unicoTheme = unicoTheme;
  }

  void setJsonFilneName(String jsonFileName) {
    _jsonFileName = jsonFileName;
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

  void setUnicoConfig(UnicoConfig unicoConfig) {
    _unicoConfig = unicoConfig;
  }

  Map<dynamic, dynamic> get getOpenCameraRequest {
    return <dynamic, dynamic>{
      'json_file_name': _jsonFileName,
      'unico_theme': _unicoTheme.getCommonMap,
      'set_auto_capture': _autoCapture,
      'set_smart_frame': _smartFrame,
      'set_timeout_session': _timeoutSession,
      'document_type': _documentType.name,
      'unico_config': _unicoConfig.getCommonMap
    };
  }
}
