import 'package:unico_check/src/clean/api/unico.check.camera.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.prepare.camera.dart';
import 'package:unico_check/src/clean/domain/entities/prepare.camera.response.dart';
import 'package:unico_check/src/clean/domain/entities/prepare.dart';
import 'package:unico_check/src/clean/domain/interface/prepare.camera.dart';
import 'camera/document/document.camera.listener.dart';
import 'camera/selfie/selfie.camera.listener.dart';
import 'camera/selfie/selfie.camera.opener.dart';
import 'camera/selfie/unico.check.camera.opener.selfie.dart';

class UnicoCheckImpl extends UnicoCheckCamera {
  late PrepareCamera _prepareCamera;

  UnicoCheckImpl(PrepareCamera openCamera) {
    _prepareCamera = openCamera;
  }

  @override
  void prepareDocumentCamera(
      {required String jsonName, required DocumentCameraListener listener}) {}

  @override
  void prepareSelfieCamera(
      {required String jsonName, required SelfieCameraListener listener}) {
    PrepareCameraResponse prepareCameraResponse = _prepareCamera.prepareCamera(
        method: MethodsConstantsPrepareCamera.prepare_camera_selfie,
        prepare: new Prepare(jsonName));

    if (prepareCameraResponse.getSuccess()) {
      listener.onCameraReady(new SelfieCameraOpener());
    } else {
      listener.onCameraFailed(prepareCameraResponse.getUnicoError());
    }
  }
}
