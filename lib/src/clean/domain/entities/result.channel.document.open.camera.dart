import 'package:unico_check/src/clean/domain/entities/result.camera.document.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

class ResultChannelDocumentOpenCamera {
  ResultCameraDocument? cameraDocumentResult;
  UnicoError? error;
  static const String response = "status";

  ResultChannelDocumentOpenCamera(
      ResultCameraDocument? resultCameraDocument, UnicoError? error) {
    this.cameraDocumentResult = resultCameraDocument;
    this.error = error;
  }
}
