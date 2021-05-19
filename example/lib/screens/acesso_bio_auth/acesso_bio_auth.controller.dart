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
    _unico.authenticate!.openAuthenticate(code: '');
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void onErrorAuthenticate(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void onSuccessAuthenticate(AuthenticateResponse response) {
    SnackbarUtil.showSuccess(message: "Success");
  }

  @override
  void userClosedCameraManually() { SnackbarUtil.showError(message: "Camera fecheda manualmente");}

}
