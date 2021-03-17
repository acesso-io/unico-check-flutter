
import '../result/error/ErrorBio.dart';


abstract class IAcessoBio
{
  ///Retorna erros que impedem a abertura de camera
  void onErrorAcessoBio(ErrorBio errorBio);
  ///Retorna ao usuario fechar a camera manualmente
  void userClosedCameraManually();
}