import '../result/error/error_bio.response.dart';

abstract class IAcessoBio {
  void onErrorAcessoBio(ErrorBioResponse error);
  void userClosedCameraManually();
}
