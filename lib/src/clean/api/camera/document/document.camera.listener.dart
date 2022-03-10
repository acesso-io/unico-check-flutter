import 'package:unico_check/src/clean/api/camera/document/unico.check.camera.opener.document.dart';

abstract class DocumentCameraListener {
  void onCameraReady(UnicoCheckCameraOpenerDocument cameraOpener);
  void onCameraFailed(String message);
}
