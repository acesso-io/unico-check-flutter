import 'package:get/get.dart';
import 'package:unico_check_example/screens/aceeso_bio_liveness/acesso_bio_liveness.controller.dart';

class AcessoBioLivenessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcessoBioLivenessController>(
      () => AcessoBioLivenessController(),
    );
  }
}
