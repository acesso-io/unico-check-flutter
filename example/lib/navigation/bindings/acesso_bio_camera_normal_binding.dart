import 'package:get/get.dart';
import 'package:unico_check_example/screens/acesso_bio_camera_normal/acesso_bio_camera_normal_controller.dart';

class AcessoBioCameraNormalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcessoBioCameraNormalController>(
          () => AcessoBioCameraNormalController(),
    );
  }
}