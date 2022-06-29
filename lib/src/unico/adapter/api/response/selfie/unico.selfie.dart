import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.dart';

/// Return the response of selfie capture
abstract class UnicoSelfie {
  /// Return the response success of selfie capture
  void onSuccessSelfie(ResultCamera result);

  /// Return the response error of selfie capture
  void onErrorSelfie(UnicoError error);
}
