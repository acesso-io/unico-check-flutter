import '../result/error/ErrorBio.dart';
import '../result/success/ResultLivenessX.dart';

abstract class IAcessoBioLiveness
{
  ///Retorna um objeto Result com os resultados do processo em caso de sucesso
  void onSuccessLiveness(ResultLivenessX result);
  ///Retorna um objeto padrao ErrorBio com o problema encontrado no processo
  void onErrorLiveness(ErrorBio errorBio);
}