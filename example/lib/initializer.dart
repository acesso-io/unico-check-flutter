import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check_example/acesso_pass.dart';

class Initializer {
  static void init() {
    _initUnico();
  }

  static void _initUnico() {
    final unicoInit = UnicoConfig(
      urlInstance: AcessoPasss.url,
      apikey: AcessoPasss.apikey,
      authToken: AcessoPasss.token,
    );

    Get.put(unicoInit);
  }
}
