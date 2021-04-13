import '../result/error/error_bio.response.dart';
import '../result/success/liveness_x.response.dart';

abstract class IAcessoBioLiveness {
  void onSuccessLiveness(LivenessXResponse response);
  void onErrorLiveness(ErrorBioResponse error);
}
