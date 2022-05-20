import 'package:unico_check/src/clean/domain/entities/result.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

class ChannelResult {
  ResultCamera? resultCamera;
  UnicoError? unicoError;
  static const String response = "status";

  ChannelResult(ResultCamera? resultCamera, UnicoError? unicoError) {
    this.resultCamera = resultCamera;
    this.unicoError = unicoError;
  }
}
