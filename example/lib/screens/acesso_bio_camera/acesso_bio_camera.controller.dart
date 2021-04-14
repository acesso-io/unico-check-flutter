import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';

class AcessoBioCameraController extends GetxController
    implements IAcessoBioCamera {
  late UnicoCheck _unico;

  AcessoBioCameraController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCamera() {
    _unico.camera!.openCamera();
  }

  @override
  void onErrorCamera(ErrorBioResponse error) {}

  @override
  void onErrorDocumentInsert(String error) {}

  @override
  void onSuccessCamera(CameraResponse response) {}

  @override
  void onSucessDocumentInsert(String processId, String typed) {}

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {}

  @override
  void userClosedCameraManually() {}
}
