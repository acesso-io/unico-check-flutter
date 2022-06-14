import 'package:unico_check/src/unico/adapter/api/unico.check.builder.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.repository.default.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
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
  final UnicoListener listener;
  final UnicoConfig unicoConfigIos;
  final UnicoConfig unicoConfigAndroid;

  UnicoCheck(
      {required this.listener,
      required this.unicoConfigAndroid,
      required this.unicoConfigIos});

  @override
  UnicoCheckCameraOpener build() {
    final processorMapper = CameraResultProcessorMapper();
    final channelUnicoDefault = ChannelUnicoDefault();
    final repository =
        ChannelRepositoryDefault(channelUnicoDefault, processorMapper);
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
        unicoListener: listener,
        timeoutSession: _timeoutSession,
        unicoConfigIos: unicoConfigIos,
        unicoConfigAndroid: unicoConfigAndroid,
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
}
