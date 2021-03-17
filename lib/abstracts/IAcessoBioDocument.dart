
import '../result/success/OCRResponse.dart';
import '../result/success/ResultCameraDocument.dart';
import '../result/success/ResultFacematch.dart';


abstract class IAcessoBioDocument {

  ///Retorna um objeto Result com os resultados do processo em caso de sucesso
  void onSuccesstDocument(ResultCameraDocument result);
  ///Retorna um objeto Result com os resultados do processo em caso de sucesso
  void onSuccessFaceMatch(ResultFacematch result);
  ///Retorna um objeto Result com os resultados do processo em caso de sucesso
  void onSuccessOCR(OCRResponse ocr);
  ///Retorna um objeto padrao ErrorBio com o problema encontrado no processo
  void onErrorDocument(String error);
  ///Retorna um objeto padrao ErrorBio com o problema encontrado no processo
  void onErrorFaceMatch(String error);
  ///Retorna um objeto padrao ErrorBio com o problema encontrado no processo
  void onErrorOCR(String error);

}