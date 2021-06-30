import '../response/success/camera_document.response.dart';
import '../response/success/facematch.response.dart';
import 'acesso_bio.interface.dart';

///IAcessoBioDocument recebe dados documento
abstract class IAcessoBioDocument extends IAcessoBio {
  void onSuccesstDocument(CameraDocumentResponse response);

  // void onSuccessFaceMatch(FacematchResponse response);

  void onErrorDocument(String error);

  // void onErrorFaceMatch(String error);

  // void onErrorOCR(String error);
}
