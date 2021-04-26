import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioAuthController extends GetxController
    implements IAcessoBioAuthenticate {
  late UnicoCheck _unico;

  AcessoBioAuthController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openAuthentication() {
    _unico.authenticate!.openLivenessAuthenticate(code: '');
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {}

  @override
  void onErrorAuthenticate(ErrorBioResponse error) {}

  @override
  void onSuccessAuthenticate(AuthenticateResponse response) {}

  @override
  void userClosedCameraManually() {}

}
