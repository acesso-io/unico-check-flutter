import '../result/error/ErrorBio.dart';
import '../result/success/ResultAuthenticate.dart';

abstract class IAcessoBioAuthenticate
{
  void onSuccessAuthenticate(ResultAuthenticate result);
  void onErrorAuthenticate(ErrorBio errorBio);
}