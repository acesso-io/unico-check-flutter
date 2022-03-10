import 'package:unico_check/src/clean/api/unico.check.camera.dart';

abstract class UnicoCheckBuilder {
  UnicoCheckBuilder setTheme();

  UnicoCheckBuilder setAutoCapture();

  UnicoCheckBuilder setSmartFrame();

  UnicoCheckBuilder setTimeoutSession();

  UnicoCheckCamera build();
}
