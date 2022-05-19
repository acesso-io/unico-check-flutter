import 'package:unico_check/src/clean/api/camera/document/unico.document.dart';
import 'package:unico_check/src/clean/api/camera/selfie/unico.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'package:unico_check/src/clean/domain/entities/methods.channel.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/interface/open.camera.dart';
import 'camera/unico.check.camera.opener.dart';

class UnicoCheckImpl extends UnicoCheckCameraOpener {
  late OpenCamera _openCamera;
  late OpenCameraRequest _openCameraRequest;
  late UnicoConfig _unicoConfig;
  late bool _autoCaptrue;
  late bool _smartFrame;

  UnicoCheckImpl({
    required OpenCamera openCamera,
    required OpenCameraRequest openCameraRequest,
    required UnicoConfig unicoConfig,
    required bool autoCaptrue,
    required bool smartFrame,
  }) {
    _openCamera = openCamera;
    _openCameraRequest = openCameraRequest;
    _unicoConfig = unicoConfig;
    _autoCaptrue = autoCaptrue;
    _smartFrame = smartFrame;
  }

  @override
  void openCameraSelfie(
      {required String jsonFileName, required UnicoSelfie listener}) {
    _openCameraRequest.setJsonFilneName(jsonFileName);
    _openCameraRequest.setUnicoConfig(_unicoConfig);
    _openCamera.openCamera(
        method: MethodsChannel.open_camera, request: _openCameraRequest);
  }

  @override
  void openCameraDocument(
      {required String jsonFileName,
      required DocumentType documentType,
      required UnicoDocument listener}) {}

  // @override
  // void prepareSelfieCamera (
  //     {required String jsonName, required SelfieCameraListener listener}) async {
  //
  //   PrepareCameraResponse prepareCameraResponse = await _prepareCamera.prepareCamera(
  //       method: MethodsConstantsPrepareCamera.prepare_camera_selfie,
  //       prepare: new Prepare(jsonName)
  //   );
  //
  //   if (prepareCameraResponse.getSuccess()){
  //       listener.onCameraReady(new SelfieCameraOpener());
  //   } else {
  //       listener.onCameraFailed(prepareCameraResponse.getUnicoError());
  //   }
  // }

}
