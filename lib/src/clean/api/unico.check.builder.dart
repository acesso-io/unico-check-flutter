import 'package:unico_check/src/clean/api/unico.check.document.camera.opener.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'unico.check.selfie.camera.opener.dart';

abstract class UnicoCheckBuilder {
  UnicoCheckBuilder setTheme({required UnicoConfig unicoConfig});
  UnicoCheckBuilder setAutoCapture({required bool autoCaptrue});
  UnicoCheckBuilder setSmartFrame({required bool smartFrame});
  UnicoCheckBuilder setTimeoutSession();
  UnicoCheckSelfieCameraOpener buildSelfieCamera();
  UnicoCheckDocumentCameraOpener buildDocumentCamera();
}
