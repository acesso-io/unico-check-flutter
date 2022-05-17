import 'package:unico_check/src/clean/api/camera/document/unico.document.dart';
import 'package:unico_check/src/clean/api/camera/selfie/unico.selfie.dart';
import 'package:unico_check/src/clean/api/unico.check.selfie.camera.opener.dart';
import 'package:unico_check/src/clean/api/unico.check.builder.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'package:unico_check/src/clean/domain/entities/request.open.camera.dart';
import 'package:unico_check/src/clean/domain/entities/request.open.document.dart';
import 'package:unico_check/src/clean/domain/entities/result.channel.selfie.open.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/usecase/usecase.open.camera.dart';

class UnicoCheckDefaultCameraConfigOpener extends UnicoCheckSelfieCameraOpener {
  late UseCaseOpenCamera _caseOpenCamera;
  late RequestOpenCamera _requestOpenCamera;

  late UnicoConfig config;
  late bool _cameraAutoCapture;
  late bool _cameraSmartFrame;

  UnicoCheckDefaultCameraConfigOpener({
    required UseCaseOpenCamera caseOpenCamera,
    required RequestOpenCamera requestOpenCamera,
    required UnicoConfig config,
    required bool cameraAutoCapture,
    required bool cameraSmartFrame,
  }) {
    _caseOpenCamera = caseOpenCamera;
    _requestOpenCamera = requestOpenCamera;
    config = config;
    _cameraAutoCapture = cameraAutoCapture;
    _cameraSmartFrame = cameraSmartFrame;
  }

  void responseReturn(
      UnicoSelfie listener, ResultChannelSelfieOpenCamera resultChannel) {
    if (resultChannel.error != null) {
      listener.onSuccessSelfie(resultChannel.cameraResult!);
    } else {
      listener.onErrorSelfie(resultChannel.error!);
    }
  }

  @override
  void openCameraSelfie(
      {required String jsonFileName, required UnicoSelfie listener}) {
    _requestOpenCamera.setConfigUnicoFileName(jsonFileName);
    _requestOpenCamera.setConfigUnico(config);
    _caseOpenCamera
        .openCamera(requestOpenCamera: _requestOpenCamera)
        .then((value) => responseReturn(listener, value));
  }
}
