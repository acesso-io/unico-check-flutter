import 'package:unico_check/src/clean/domain/entities/result.camera.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

class ResultChannelSelfieOpenCamera {
  ResultCameraSelfie? cameraResult;
  UnicoError? error;
  static const String response = "status";

  ResultChannelSelfieOpenCamera(
      ResultCameraSelfie? cameraResult, UnicoError? error) {
    this.cameraResult = cameraResult;
    this.error = error;
  }
}
