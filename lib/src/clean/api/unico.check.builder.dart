import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'camera/unico.check.camera.opener.dart';

abstract class UnicoCheckBuilder {
  UnicoCheckBuilder setTheme({required UnicoConfig unicoConfig});

  UnicoCheckBuilder setAutoCapture({ required bool autoCaptrue });

  UnicoCheckBuilder setSmartFrame({ required bool smartFrame});

  UnicoCheckBuilder setTimeoutSession();

  UnicoCheckCameraOpener build();
}
