import '../result/error/error_bio.response.dart';
import '../result/success/camera.response.dart';

abstract class IAcessoBioCamera {
  void onSuccessCamera(CameraResponse response);
  void onErrorCamera(ErrorBioResponse error);
  void onSucessDocumentInsert(String processId, String typed);
  void onErrorDocumentInsert(String error);
}
