import 'package:unico_check/src/core/abstracts/acesso_bio.interface.dart';

import '../response/error/error_bio.response.dart';
import '../response/success/liveness_x.response.dart';

abstract class IAcessoBioLiveness extends IAcessoBio {
  void onSuccessLiveness(LivenessXResponse response);
  void onErrorLiveness(ErrorBioResponse error);
}
