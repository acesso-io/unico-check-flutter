import 'package:get/get.dart';
import 'package:unico_check_example/screens/acesso_bio_auth/acesso_bio_auth.controller.dart';

class AcessoBioAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcessoBioAuthController>(() => AcessoBioAuthController());
  }
}
