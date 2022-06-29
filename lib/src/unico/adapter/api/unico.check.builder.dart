import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
import 'unico.check.camera.opener.dart';

abstract class UnicoCheckBuilder {
  /// Set your custom theme of camera by UnicoTheme object
  UnicoCheckBuilder setTheme({required UnicoTheme unicoTheme});

  /// Set if your camera will auto capture
  UnicoCheckBuilder setAutoCapture({required bool autoCapture});

  /// Set if your camera will have a smart frame
  UnicoCheckBuilder setSmartFrame({required bool smartFrame});

  /// Set the timing of your session capture
  UnicoCheckBuilder setTimeoutSession({required double timeoutSession});

  /// Build all configuration
  UnicoCheckCameraOpener build();
}
