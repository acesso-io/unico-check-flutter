import '../result/success/camera_document.response.dart';
import '../result/success/facematch.response.dart';
import '../result/success/ocr.response.dart';

abstract class IAcessoBioDocument {
  void onSuccesstDocument(CameraDocumentResponse response);

  void onSuccessFaceMatch(FacematchResponse response);

  void onSuccessOCR(OCRResponse ocr);

  void onErrorDocument(String error);

  void onErrorFaceMatch(String error);

  void onErrorOCR(String error);
}
