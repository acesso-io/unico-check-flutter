
import '../result/error/ErrorBio.dart';
import '../result/success/ResultCamera.dart';

abstract class IAcessoBioCamera {
  void onSuccessCamera(ResultCamera result);
  void onErrorCamera(ErrorBio errorBio);
  void onSucessDocumentInsert(String processId, String typed);
  void onErrorDocumentInsert(String error);
}
