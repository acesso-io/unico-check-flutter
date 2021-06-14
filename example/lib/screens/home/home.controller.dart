import 'package:get/get.dart';
import 'package:unico_check_example/navigation/routes.dart';

class HomeController extends GetxController {

  void openCameraNormal() => Get.toNamed(Routes.ACESSO_BIO_CAMERA_NORMAL);

  void openCamera() => Get.toNamed(Routes.ACESSO_BIO_CAMERA);

  void openDocument() => Get.toNamed(Routes.ACESSO_BIO_DOCUMENT);


}
