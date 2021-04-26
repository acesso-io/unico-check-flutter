import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioDocumentController extends GetxController
    implements IAcessoBioDocument {
  late UnicoCheck _unico;

  AcessoBioDocumentController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCameraDocument() {
    _unico.document!.openFaceMatch(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void userClosedCameraManually() {}

  @override
  void onErrorDocument(String error) {
    SnackbarUtil.showError(message: error);
  }

  @override
  void onErrorFaceMatch(String error) {
    SnackbarUtil.showError(message: error);
  }

  @override
  void onErrorOCR(String error) {
    SnackbarUtil.showError(message: error);
  }

  @override
  void onSuccessFaceMatch(FacematchResponse response) {}

  @override
  void onSuccessOCR(OCRResponse ocr) {}

  @override
  void onSuccesstDocument(CameraDocumentResponse response) {}

}
