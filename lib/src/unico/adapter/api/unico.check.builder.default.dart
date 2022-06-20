import 'package:unico_check/src/unico/adapter/api/unico.check.builder.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/di/injection.dart';
import 'package:unico_check/src/unico/di/module.dart';
import 'package:unico_check/src/unico/domain/entities/camera_opener/camera.opener.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

import 'unico.check.camera.opener.dart';

class UnicoCheck extends UnicoCheckBuilder {
  UnicoTheme _unicoTheme = UnicoTheme();

  UnicoTheme get unicoTheme => _unicoTheme;

  bool _autoCapture = true;

  bool get autoCapture => _autoCapture;

  bool _smartFrame = true;

  bool get smartFrame => _smartFrame;

  double _timeoutSession = 45;

  double get timeoutSession => _timeoutSession;

  final UnicoListener listener;
  final UnicoConfig unicoConfigIos;
  final UnicoConfig unicoConfigAndroid;

  UnicoCheck(
      {required this.listener,
      required this.unicoConfigAndroid,
      required this.unicoConfigIos}) {
    Module.initDependencies();
  }

  @override
  UnicoCheckCameraOpener build() {
    final cameraOpenerConfig = CameraOpenerConfigEntity(
      unicoTheme: _unicoTheme,
      autoCapture: _autoCapture,
      smartFrame: _smartFrame,
      timeoutSession: _timeoutSession,
      unicoConfigAndroid: unicoConfigAndroid,
      unicoConfigIos: unicoConfigIos,
      unicoListener: listener,
    );
    return UnicoCheckCameraOpenerDefault(
      openCameraUseCase: Injection.I.get(),
      openCameraRequest: Injection.I.get(),
      cameraOpenerConfig: cameraOpenerConfig,
      unicoCallBackUseCase: Injection.I.get(),
      openCheckCameraFactory: Injection.I.get(),
    );
  }

  @override
  UnicoCheckBuilder setAutoCapture({required bool autoCapture}) {
    _autoCapture = autoCapture;
    return this;
  }

  @override
  UnicoCheckBuilder setSmartFrame({required bool smartFrame}) {
    _smartFrame = smartFrame;
    return this;
  }

  @override
  UnicoCheckBuilder setTheme({required UnicoTheme unicoTheme}) {
    _unicoTheme = unicoTheme;
    return this;
  }

  @override
  UnicoCheckBuilder setTimeoutSession({required double timeoutSession}) {
    _timeoutSession = timeoutSession;
    return this;
  }
}
