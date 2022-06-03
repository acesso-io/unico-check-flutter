import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/entities/unico.theme.dart';
import 'unico.check.camera.opener.dart';

abstract class UnicoCheckBuilder {
  UnicoCheckBuilder setTheme({required UnicoTheme unicoTheme});

  UnicoCheckBuilder setAutoCapture({required bool autoCapture});

  UnicoCheckBuilder setSmartFrame({required bool smartFrame});

  UnicoCheckBuilder setTimeoutSession({required double timeoutSession});

  UnicoCheckBuilder setUnicoConfigIos({required UnicoConfig unicoConfig});

  UnicoCheckCameraOpener build();
}
