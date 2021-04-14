import '../response/success/camera_document.response.dart';
import '../response/success/facematch.response.dart';
import '../response/success/ocr.response.dart';
import 'acesso_bio.interface.dart';

abstract class IAcessoBioDocument extends IAcessoBio {
  void onSuccesstDocument(CameraDocumentResponse response);

  void onSuccessFaceMatch(FacematchResponse response);

  void onSuccessOCR(OCRResponse ocr);

  void onErrorDocument(String error);

  void onErrorFaceMatch(String error);

  void onErrorOCR(String error);
}
