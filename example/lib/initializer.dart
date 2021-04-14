import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';

class Initializer {
  Future<void> init() async {
    initUnico();
  }

  void initUnico() {
    final unicoInit = UnicoConfig(
      urlInstance: 'urlAqui',
      apikey: 'apiKey',
      authToken: 'authToken',
    );

    Get.put(unicoInit);
  }
}
