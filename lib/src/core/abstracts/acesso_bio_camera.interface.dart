import '../response/error/error_bio.response.dart';
import '../response/success/camera.response.dart';
import 'acesso_bio.interface.dart';

///IAcessoBioCamera recebe dados camera inteligente e insercao de documento
abstract class IAcessoBioCamera extends IAcessoBio {
  void onSuccessCamera(CameraResponse response);
  void onErrorCamera(ErrorBioResponse error);
  void onSucessDocumentInsert(String processId, String typed);
  void onErrorDocumentInsert(String error);
}
