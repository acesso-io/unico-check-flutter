import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.dart';

/// Return the response of document capture
abstract class UnicoDocument {
  /// Return the response success of document capture
  void onSuccessDocument(ResultCamera resultCamera);

  /// Return the response error of document capture
  void onErrorDocument(UnicoError error);
}
