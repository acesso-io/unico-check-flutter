import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

class CameraOpenerConfigEntity {
  final UnicoTheme unicoTheme;
  final bool autoCapture;
  final bool smartFrame;
  final double timeoutSession;
  final UnicoConfig unicoConfigIos;
  final UnicoConfig unicoConfigAndroid;
  final UnicoListener unicoListener;

  CameraOpenerConfigEntity({
    required this.unicoTheme,
    required this.autoCapture,
    required this.smartFrame,
    required this.timeoutSession,
    required this.unicoConfigIos,
    required this.unicoConfigAndroid,
    required this.unicoListener,
  });
}
