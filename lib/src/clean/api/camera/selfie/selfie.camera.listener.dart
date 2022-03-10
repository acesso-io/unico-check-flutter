import 'package:unico_check/src/clean/api/camera/selfie/unico.check.camera.opener.selfie.dart';

abstract class SelfieCameraListener {
  void onCameraReady(UnicoCheckCameraOpenerSelfie cameraOpener);

  void onCameraFailed(String message);
}
