import 'package:get/get.dart';
import 'package:unico_check_example/screens/aceeso_bio_ocr/acesso_bio_ocr.controller.dart';


class AcessoBioOcrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcessoBioOcrController>(
          () => AcessoBioOcrController(),
    );
  }
}