
import '../result/error/ErrorBio.dart';
import '../result/success/ResultCamera.dart';

abstract class IAcessoBioCamera {
  ///Retorna um objeto ResultCamera quando resultado sucesso
  void onSuccessCamera(ResultCamera result);
  ///Retorna um objeto padrao ErrorBio com o problema encontrado no processo
  void onErrorCamera(ErrorBio errorBio);
  ///Retorna um objeto ResultCamera quando resultado sucesso
  void onSucessDocumentInsert(String processId, String typed);
  ///Retorna um objeto padrao ErrorBio com o problema encontrado no processo
  void onErrorDocumentInsert(String error);
}
