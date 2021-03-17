import '../result/error/ErrorBio.dart';
import '../result/success/ResultLivenessX.dart';

abstract class IAcessoBioLiveness
{
  void onSuccessLiveness(ResultLivenessX result);
  void onErrorLiveness(ErrorBio errorBio);
}