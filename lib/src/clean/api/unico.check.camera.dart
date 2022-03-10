import 'camera/document/document.camera.listener.dart';
import 'camera/selfie/selfie.camera.listener.dart';

abstract class UnicoCheckCamera {
  void prepareSelfieCamera(
      {required String jsonName, required SelfieCameraListener listener});

  void prepareDocumentCamera(
      {required String jsonName, required DocumentCameraListener listener});
}
