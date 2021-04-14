import 'package:get/get.dart';
import 'package:unico_check_example/screens/aceeso_bio_document/acesso_bio_document.controller.dart';

class AcessoBioDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcessoBioDocumentController>(
      () => AcessoBioDocumentController(),
    );
  }
}
