
import '../result/success/OCRResponse.dart';
import '../result/success/ResultCameraDocument.dart';
import '../result/success/ResultFacematch.dart';


abstract class IAcessoBioDocument {

  void onSuccesstDocument(ResultCameraDocument result);

  void onSuccessFaceMatch(ResultFacematch result);

  void onSuccessOCR(OCRResponse ocr);

  void onErrorDocument(String error);

  void onErrorFaceMatch(String error);

  void onErrorOCR(String error);

}