import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioCameraController extends GetxController
    implements IAcessoBioSelfie {
  late UnicoCheck _unico;
  late ValueNotifier<String> base64;

  AcessoBioCameraController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCamera() {
    _unico.camera!.setAutoCapture(true);
    _unico.camera!.setSmartFrame(true);
    _unico.camera!.openCamera();
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
    SnackbarUtil.showSuccess(message: error.description);
  }

  @override
  void onErrorSelfie(ErrorBioResponse error) {
    SnackbarUtil.showSuccess(message: error.description);
  }

  @override
  void onSuccessSelfie(CameraResponse response) {
    SnackbarUtil.showSuccess(message: "sucesso");
  }

  @override
  void onSystemChangedTypeCameraTimeoutFaceInference() {
    SnackbarUtil.showSuccess(message: "");
  }

  @override
  void onSystemClosedCameraTimeoutSession() {
    SnackbarUtil.showSuccess(message: "");
  }

  @override
  void onUserClosedCameraManually() {
    SnackbarUtil.showSuccess(message: "");
  }
}
