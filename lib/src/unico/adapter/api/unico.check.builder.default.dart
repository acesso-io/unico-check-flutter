import 'package:unico_check/src/unico/adapter/api/unico.check.builder.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/di/injection.dart';
import 'package:unico_check/src/unico/di/module.dart';
import 'package:unico_check/src/unico/domain/entities/camera_opener/camera.opener.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.locale.types.dart';
import 'package:unico_check/src/unico/domain/entities/unico.environment.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

import 'unico.check.camera.opener.dart';

///Unico camera builder
class UnicoCheck extends UnicoCheckBuilder {

  UnicoTheme _unicoTheme = UnicoTheme();
  UnicoTheme get unicoTheme => _unicoTheme;

  bool _autoCapture = true;
  bool get autoCapture => _autoCapture;

  bool _smartFrame = true;
  bool get smartFrame => _smartFrame;

  double _timeoutSession = 45;
  double get timeoutSession => _timeoutSession;

  UnicoLocaleTypes _unicoLocaleTypes = UnicoLocaleTypes.PT_BR;
  UnicoLocaleTypes get unicoLocaleTypes => _unicoLocaleTypes;

  UnicoEnvironment _unicoEnvironment = UnicoEnvironment.PROD;
  UnicoEnvironment get unicoEnvironment => _unicoEnvironment;

  /// Return the camera callback
  final UnicoListener listener;

  /// Set credentials of IOS platform
  final UnicoConfig unicoConfigIos;

  /// Set credentials of Android platform
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
      localeTypes: _unicoLocaleTypes,
      environment: _unicoEnvironment,
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

  @override
  UnicoCheckBuilder setLocale({required UnicoLocaleTypes unicoLocaleTypes}) {
    _unicoLocaleTypes = unicoLocaleTypes;
    return this;
  }

  @override
  UnicoCheckBuilder setEnvironment({required UnicoEnvironment unicoEnvironment}) {
    _unicoEnvironment = unicoEnvironment;
    return this;
  }
}
