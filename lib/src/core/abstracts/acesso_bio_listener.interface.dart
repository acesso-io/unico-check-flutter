import '../response/error/error_bio.response.dart';

///IAcessoBio recebe dados genericos
/// onErrorAcessoBio sera chamado sempre que um erro relacionado ao processo for chamado
/// onUserClosedCameraManually sera chamado quando o usuario fechar a camera manualmente
/// onSystemClosedCameraTimeoutSession sera chamado quando a camera for
/// fechada porque atingiu o limite de tempo da cessão
/// onSystemChangedTypeCameraTimeoutFaceInference será chamado quando mudar a camera para camera normal
/// ou quando atingir tempo determinado ou tempo padrão
abstract class AcessoBioListener {
  void onErrorAcessoBio(ErrorBioResponse error);

  void onUserClosedCameraManually();

  void onSystemClosedCameraTimeoutSession();

  void onSystemChangedTypeCameraTimeoutFaceInference();
}
