import '../../../unico_check.dart';
import '../response/success/camera_document.response.dart';
import 'acesso_bio.interface.dart';

///IAcessoBioDocument recebe dados documento
///onSuccessCamera chamado quando o processo ocorreu perfeitamente
///onErrorCamera chamado quando ocorreu erro no processo
abstract class IAcessoBioDocument extends IAcessoBio {
  void onSuccesstDocument(CameraDocumentResponse response);

  void onErrorDocument(ErrorBioResponse error);
}
