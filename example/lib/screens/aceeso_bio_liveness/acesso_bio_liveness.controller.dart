import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioLivenessController extends GetxController
    implements IAcessoBioLiveness {
  late UnicoCheck _unico;

  AcessoBioLivenessController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openLiveness() {
    _unico.liveness!.openLiveness();
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void userClosedCameraManually() {}

  @override
  void onErrorLiveness(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void onSuccessLiveness(LivenessXResponse response) {}
}
