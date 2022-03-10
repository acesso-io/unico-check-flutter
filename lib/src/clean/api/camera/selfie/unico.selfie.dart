import 'package:unico_check/src/clean/domain/entities/result.camera.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class UnicoSelfie {
  void onSuccessSelfie(ResultCameraSelfie result);

  void onErrorSelfie(UnicoError errorBio);
}
