import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';

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
  void onErrorAcessoBio(ErrorBioResponse error) {}

  @override
  void userClosedCameraManually() {}

  @override
  void onErrorLiveness(ErrorBioResponse error) {}

  @override
  void onSuccessLiveness(LivenessXResponse response) {}
}
