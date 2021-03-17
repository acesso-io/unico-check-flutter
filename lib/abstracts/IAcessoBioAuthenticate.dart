import '../result/error/ErrorBio.dart';
import '../result/success/ResultAuthenticate.dart';

abstract class IAcessoBioAuthenticate
{
  ///Invocado quando obtem sucesso no resultado
  void onSuccessAuthenticate(ResultAuthenticate result);
  ///O metodo é invocado quando obtem erro na authenticação
  void onErrorAuthenticate(ErrorBio errorBio);
}