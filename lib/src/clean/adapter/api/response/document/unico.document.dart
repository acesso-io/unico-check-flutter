import 'package:unico_check/src/clean/domain/entities/result.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class UnicoDocument {
  void onSuccessDocument(ResultCamera base64);

  void onErrorDocument(UnicoError error);
}
