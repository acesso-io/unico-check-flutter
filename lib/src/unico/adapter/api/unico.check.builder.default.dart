import 'package:unico_check/src/unico/adapter/api/unico.check.builder.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.repository.impl.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';
import 'package:unico_check/src/unico/plugins/channel/channel.unico.default.dart';

import 'unico.check.camera.opener.dart';

class UnicoCheck extends UnicoCheckBuilder {
  late UnicoTheme _unicoTheme;
  late bool _autoCapture = true;
  late bool _smartFrame = true;
  late double _timeoutSession = 45;
  late UnicoListener _listener;
  late UnicoConfig _unicoConfigIos;

  UnicoCheck(UnicoListener listener) {
    _listener = listener;
  }

  @override
  UnicoCheckCameraOpener build() {
    final processorMapper = CameraResultProcessorMapper();
    final channelUnicoDefault = ChannelUnicoDefault();
    final repository =  ChannelRepositoryImpl(channelUnicoDefault, processorMapper);
    final openCameraUseCase = OpenCameraUseCase(repository);

    return UnicoCheckCameraOpenerDefault(
        openCameraUseCase: openCameraUseCase,
        openCameraRequest: OpenCameraRequest(),
        unicoTheme: _unicoTheme,
        autoCapture: _autoCapture,
        smartFrame: _smartFrame,
        unicoListener: _listener,
        timeoutSession: _timeoutSession,
        unicoConfigIos: _unicoConfigIos,
        unicoCallBackUseCase: UnicoCallBackUseCase());
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
}
