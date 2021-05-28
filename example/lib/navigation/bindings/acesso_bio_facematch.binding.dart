import 'package:get/get.dart';
import 'package:unico_check_example/screens/acesso_bio_faceMatch/acesso_bio_facematch.controller.dart';


class AcessoBioFaceMatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcessoBioFaceMatchController>(() => AcessoBioFaceMatchController());
  }
}