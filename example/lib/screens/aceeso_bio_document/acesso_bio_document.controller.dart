import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioDocumentController implements IAcessoBioDocument {
  late UnicoCheck _unico;

  AcessoBioDocumentController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openCameraDocumentCNH() {
    _unico.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  void openCameraDocumentRGFrente() {
    _unico.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.rg_frente,
    );
  }

  void openCameraDocumentRGVerso() {
    _unico.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.rg_verso,
    );
  }

  @override
  void onErrorDocument(ErrorBioResponse error) {
    SnackbarUtil.showError(message: error.description);
  }

  @override
  void onSuccesstDocument(CameraDocumentResponse response) {
    SnackbarUtil.showSuccess(message: "Success");
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
  void systemChangedTypeCameraTimeoutFaceInference() {
    SnackbarUtil.showError(message: "Timeout: changed to camera normal ");
  }

  @override
  void systemClosedCameraTimeoutSession() {
    SnackbarUtil.showError(message: "Timeout: close camera ");
  }
}
