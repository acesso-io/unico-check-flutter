import 'package:get/get.dart';
import 'package:unico_check_example/screens/acesso_bio_camera/acesso_bio_camera.controller.dart';

class AcessoBioCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcessoBioCameraController>(() => AcessoBioCameraController());
  }
}
