import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioOcrController extends GetxController
    implements IAcessoBioDocument {
  late UnicoCheck _unico;

  AcessoBioOcrController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCameraOcr() {
    _unico.document!.openCameraDocumentOCR(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void userClosedCameraManually() {
    SnackbarUtil.showError(message: "Camera fecheda manualmente");
  }

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
  void onSuccessFaceMatch(FacematchResponse response) {
    SnackbarUtil.showSuccess(message: "Success");
  }

  @override
  void onSuccessOCR(OCRResponse ocr) {
    SnackbarUtil.showSuccess(message: "Success");
  }

  @override
  void onSuccesstDocument(CameraDocumentResponse response) {
    SnackbarUtil.showSuccess(message: "Success");
  }

}
