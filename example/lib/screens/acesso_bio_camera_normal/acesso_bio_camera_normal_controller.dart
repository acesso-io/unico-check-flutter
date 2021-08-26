import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioCameraNormalController extends GetxController
    implements IAcessoBioCamera {
  late UnicoCheck _unico;

  AcessoBioCameraNormalController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCamera() {
    _unico.camera!.setAutoCapture(false);
    _unico.camera!.setSmartFrame(false);
    _unico.camera!.openCamera();
  }

  @override
  void onErrorCamera(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void onSuccessCamera(CameraResponse response) {
    SnackbarUtil.showSuccess(message: "Success");
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void userClosedCameraManually() {
    SnackbarUtil.showError(message: "Camera fecheda manualmente");
  }

  @override
  void systemChangedTypeCameraTimeoutFaceInference() {
    SnackbarUtil.showError(message: "Timeout: changed to camera normal ");
  }

  @override
  void systemClosedCameraTimeoutSession() {
    SnackbarUtil.showError(message: "Timeout: close camera ");
  }
}
