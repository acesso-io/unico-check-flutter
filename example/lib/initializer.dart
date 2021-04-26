import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/acessoPass.dart';

class Initializer {
  static void init() {
    _initUnico();
  }

  static void _initUnico() {
    final unicoInit = UnicoConfig(urlInstance: acessoPass.url, apikey: acessoPass.apikey, authToken: acessoPass.token);
    Get.put(unicoInit);
  }
}
