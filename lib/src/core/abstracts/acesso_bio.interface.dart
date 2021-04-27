import '../response/error/error_bio.response.dart';

///IAcessoBio recebe dados genericos
abstract class IAcessoBio {
  void onErrorAcessoBio(ErrorBioResponse error);
  void userClosedCameraManually();
}
