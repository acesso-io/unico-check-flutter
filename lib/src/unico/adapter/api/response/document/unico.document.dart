import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.dart';

abstract class UnicoDocument {
  void onSuccessDocument(ResultCamera base64);

  void onErrorDocument(UnicoError error);
}
