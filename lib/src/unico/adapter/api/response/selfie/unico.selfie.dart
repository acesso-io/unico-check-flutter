import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.dart';

abstract class UnicoSelfie {
  void onSuccessSelfie(ResultCamera result);

  void onErrorSelfie(UnicoError error);
}
