import 'package:unico_check/src/clean/api/unico.check.builder.dart';
import 'package:unico_check/src/clean/api/unico.check.camera.dart';
import 'package:unico_check/src/clean/api/unico.check.camera.impl.dart';

class UnicoCheck extends UnicoCheckBuilder {

  @override
  UnicoCheckCamera build() {
    return new UnicoCheckImpl();
  }

  @override
  UnicoCheckBuilder setAutoCapture() {
    return this;
  }

  @override
  UnicoCheckBuilder setSmartFrame() {
    return this;
  }

  @override
  UnicoCheckBuilder setTheme() {
    return this;
  }

  @override
  UnicoCheckBuilder setTimeoutSession() {
    return this;
  }
}
