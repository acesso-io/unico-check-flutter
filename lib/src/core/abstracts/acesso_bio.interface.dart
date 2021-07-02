import '../response/error/error_bio.response.dart';

///IAcessoBio recebe dados genericos
/// onErrorAcessoBio sera chamado sempre que um erro relacionado ao processo for chamado
/// userClosedCameraManually sera chamado quando o usuario fechar a camera manualmente
/// systemClosedCameraTimeoutSession sera chamado quando a camera for
/// fechada porque atingiu o limite de tempo da cessão
/// systemChangedTypeCameraTimeoutFaceInference será chamado quando mudar a camera para camera normal
/// ou quando atingir tempo determinado ou tempo padrão
abstract class IAcessoBio {
  void onErrorAcessoBio(ErrorBioResponse error);
  void userClosedCameraManually();
  void systemClosedCameraTimeoutSession();
  void systemChangedTypeCameraTimeoutFaceInference();
}
