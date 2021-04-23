import 'package:get/get.dart';
import 'package:unico_check_example/navigation/routes.dart';

class HomeController extends GetxController {
  void openLiveness() => Get.toNamed(Routes.ACESSO_BIO_LIVENESS);

  void openDocument() => Get.toNamed(Routes.ACESSO_BIO_DOCUMENT);

  void openCamera() => Get.toNamed(Routes.ACESSO_BIO_CAMERA);
}
