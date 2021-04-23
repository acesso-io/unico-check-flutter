import '../response/error/error_bio.response.dart';
import '../response/success/authenticate.response.dart';
import 'acesso_bio.interface.dart';

abstract class IAcessoBioAuthenticate extends IAcessoBio {
  void onSuccessAuthenticate(AuthenticateResponse response);
  void onErrorAuthenticate(ErrorBioResponse error);
}
