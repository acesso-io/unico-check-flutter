import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';

class Initializer {
  static void init() {
    _initUnico();
  }

  static void _initUnico() {
    final unicoInit = UnicoConfig(
        // androidColorSilhoutte: "#901850"
        // androidColorBackground: "#901850"
    );
    Get.put(unicoInit);
  }
}
