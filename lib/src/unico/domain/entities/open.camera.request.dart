import 'package:unico_check/src/unico/domain/entities/document.type.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

class OpenCameraRequest {
  UnicoTheme? _unicoTheme;

  UnicoTheme? get unicoTheme => _unicoTheme;

  bool _autoCapture = true;

  bool get autoCapture => _autoCapture;

  bool _smartFrame = true;

  bool get smartFrame => _smartFrame;

  double? _timeoutSession;

  double? get timeoutSession => _timeoutSession;

  DocumentType _documentType = DocumentType.NONE;

  DocumentType get documentType => _documentType;

  UnicoConfig? _unicoConfigIos;

  UnicoConfig? get unicoConfigIos => _unicoConfigIos;

  UnicoConfig? _unicoConfigAndroid;

  UnicoConfig? get unicoConfigAndroid => _unicoConfigAndroid;

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
}
