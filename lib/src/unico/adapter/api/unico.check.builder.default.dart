import 'package:unico_check/src/unico/adapter/api/unico.check.builder.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/di/di.dart';
import 'package:unico_check/src/unico/di/module.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
import 'unico.check.camera.opener.dart';

class UnicoCheck extends UnicoCheckBuilder {
  UnicoTheme _unicoTheme = UnicoTheme();
  bool _autoCapture = true;
  bool _smartFrame = true;
  double _timeoutSession = 45;
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
    return UnicoCheckCameraOpenerDefault(
        openCameraUseCase: Di.I.get(),
        openCameraRequest: Di.I.get(),
        unicoTheme: _unicoTheme,
        autoCapture: _autoCapture,
        smartFrame: _smartFrame,
        unicoListener: listener,
        timeoutSession: _timeoutSession,
        unicoConfigIos: unicoConfigIos,
        unicoConfigAndroid: unicoConfigAndroid,
        unicoCallBackUseCase: Di.I.get());
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