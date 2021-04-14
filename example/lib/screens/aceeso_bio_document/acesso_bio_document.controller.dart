import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';

class AcessoBioDocumentController extends GetxController
    implements IAcessoBioDocument {
  late UnicoCheck _unico;

  AcessoBioDocumentController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCameraDocument() {
    _unico.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {}

  @override
  void userClosedCameraManually() {}

  @override
  void onErrorDocument(String error) {}

  @override
  void onErrorFaceMatch(String error) {}

  @override
  void onErrorOCR(String error) {}

  @override
  void onSuccessFaceMatch(FacematchResponse response) {}

  @override
  void onSuccessOCR(OCRResponse ocr) {}

  @override
  void onSuccesstDocument(CameraDocumentResponse response) {}
}
