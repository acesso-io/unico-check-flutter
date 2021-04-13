import '../result/error/error_bio.response.dart';
import '../result/success/authenticate.response.dart';

abstract class IAcessoBioAuthenticate {
  void onSuccessAuthenticate(AuthenticateResponse response);
  void onErrorAuthenticate(ErrorBioResponse error);
}
