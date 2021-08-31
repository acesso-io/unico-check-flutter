import '../response/error/error_bio.response.dart';
import '../response/success/camera.response.dart';
import 'acesso_bio_listener.interface.dart';

///IAcessoBioCamera recebe dados camera inteligente
///onSuccessCamera chamado quando o processo ocorreu perfeitamente
///onErrorCamera chamado quando ocorreu erro no processo
abstract class IAcessoBioSelfie extends AcessoBioListener {
  void onSuccessSelfie(CameraResponse response);

  void onErrorSelfie(ErrorBioResponse error);
}
