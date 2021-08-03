import '../response/error/error_bio.response.dart';
import '../response/success/camera.response.dart';
import 'acesso_bio.interface.dart';

///IAcessoBioCamera recebe dados camera inteligente
///onSuccessCamera chamado quando o processo ocorreu perfeitamente
///onErrorCamera chamado quando ocorreu erro no processo
abstract class IAcessoBioCamera extends IAcessoBio {
  void onSuccessCamera(CameraResponse response);

  void onErrorCamera(ErrorBioResponse error);
}
