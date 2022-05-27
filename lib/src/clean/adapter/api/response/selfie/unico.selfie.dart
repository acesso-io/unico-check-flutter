import 'package:unico_check/src/clean/domain/entities/result.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class UnicoSelfie {
  void onSuccessSelfie(ResultCamera result);

  void onErrorSelfie(UnicoError result);
}
