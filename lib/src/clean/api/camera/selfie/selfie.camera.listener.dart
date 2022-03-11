import 'package:unico_check/src/clean/api/camera/selfie/unico.check.camera.opener.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class SelfieCameraListener {
  void onCameraReady(UnicoCheckCameraOpenerSelfie cameraOpener);

  void onCameraFailed(UnicoError? error);
}
