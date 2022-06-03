import 'package:unico_check/src/clean/domain/entities/result.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class UnicoDocument {
  void onSuccessDocument(ResultCamera resultCamera);

  void onErrorDocument(UnicoError error);
}
