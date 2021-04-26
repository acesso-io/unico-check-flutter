import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioCameraController extends GetxController
    implements IAcessoBioCamera {
  late UnicoCheck _unico;

  AcessoBioCameraController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCamera() {
    _unico.camera!.openCamera();
  }

  void openCameraOnline() {
    // _unico.camera!.openCameraWithCreateProcess();
  }

  @override
  void onSuccessCamera(CameraResponse response) {
    print(response.processID);
  }

  @override
  void onSucessDocumentInsert(String processId, String typed) {}

  @override
  void userClosedCameraManually() {}

  @override
  void onErrorCamera(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void onErrorDocumentInsert(String error) {
    SnackbarUtil.showError(message: error);
  }
}
