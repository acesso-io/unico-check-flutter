import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';

class Initializer {
  static void init() {
    _initUnico();
  }

  static void _initUnico() {
    final unicoInit = UnicoConfig(
        setTimeoutSession: 50.0,
        setTimeoutToFaceInference: 50.0
    );
    Get.put(unicoInit);
  }
}
