import 'package:unico_check/src/unico/adapter/api/unico.check.builder.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.repository.impl.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.default.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.default.dart';
import 'package:unico_check/src/unico/domain/mapper/unico_error_mapper.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';
import 'package:unico_check/src/unico/plugins/channel/channel.unico.default.dart';

import 'unico.check.camera.opener.dart';

class UnicoCheck extends UnicoCheckBuilder {
  UnicoTheme _unicoTheme = UnicoTheme();
  bool _autoCapture = true;
  bool _smartFrame = true;
  double _timeoutSession = 45;
  late UnicoListener _listener;
  late UnicoConfig _unicoConfigIos;
  late UnicoConfig _unicoConfigAndroid;

  UnicoCheck(UnicoListener listener) {
    _listener = listener;
  }

  @override
  UnicoCheckCameraOpener build() {
    final processorMapper = CameraResultProcessorMapper();
    final channelUnicoDefault = ChannelUnicoDefault();
    final repository =  ChannelRepositoryImpl(channelUnicoDefault, processorMapper);
    final openCameraUseCase = OpenCameraUseCase(repository);
    final unicoErrorMapper = UnicoErrorMapper();
    final unicoCallBackUseCase = UnicoCallBackUseCase(unicoErrorMapper);
    final openCameraRequest = OpenCameraRequest();

    return UnicoCheckCameraOpenerDefault(
        openCameraUseCase: openCameraUseCase,
        openCameraRequest: openCameraRequest,
        unicoTheme: _unicoTheme,
        autoCapture: _autoCapture,
        smartFrame: _smartFrame,
        unicoListener: _listener,
        timeoutSession: _timeoutSession,
        unicoConfigIos: _unicoConfigIos,
        unicoConfigAndroid: _unicoConfigAndroid,
        unicoCallBackUseCase: UnicoCallBackUseCaseDefault());
        unicoCallBackUseCase: unicoCallBackUseCase);
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
  UnicoCheckBuilder setUnicoConfigIos({required UnicoConfig unicoConfig}) {
    _unicoConfigIos = unicoConfig;
    return this;
  }

  @override
  UnicoCheckBuilder setUnicoConfigAndroid({required UnicoConfig unicoConfig}) {
    _unicoConfigAndroid = unicoConfig;
    return this;
  }
}
