import 'package:unico_check/src/clean/domain/entities/result.camera.document.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class UnicoDocument {
  void onSuccessDocument(ResultCameraDocument base64);

  void onErrorDocument(UnicoError error);
}
