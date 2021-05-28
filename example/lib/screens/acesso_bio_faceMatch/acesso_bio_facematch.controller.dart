import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/utils/snackbar.util.dart';

class AcessoBioFaceMatchController extends GetxController
    implements IAcessoBioDocument {
  late UnicoCheck _unico;

  AcessoBioFaceMatchController() {
    _unico = UnicoCheck(context: this, config: Get.find());
  }

  void openFaceMatch() {
    _unico.document!.openFaceMatch(documentType: DocumentsTypeConstants.cnh);
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
    SnackbarUtil.showSuccess(message: "Success :"+response.status.toString());
  }

  @override
  void onSuccessOCR(OCRResponse ocr) {
    SnackbarUtil.showSuccess(message: "Success Name:"+ocr.name);
  }

  @override
  void onSuccesstDocument(CameraDocumentResponse response) {
    SnackbarUtil.showSuccess(message: "Success");
  }

}
