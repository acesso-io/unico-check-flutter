import 'package:unico_check/src/clean/adapter/repository/channel.repository.default.dart';
import 'package:unico_check/src/clean/api/unico.check.builder.dart';
import 'package:unico_check/src/clean/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/usecase/open.camera.default.usecase.dart';
import 'package:unico_check/src/clean/plugins/channel/channel.unico.default.dart';
import 'unico.check.camera.opener.dart';

class UnicoCheck extends UnicoCheckBuilder {

  late UnicoConfig _unicoConfig;
  late bool _autoCaptrue = true;
  late bool _smartFrame = true;
  late double _timeoutSession = 0;

  @override
  UnicoCheckCameraOpener build() {
    return new UnicoCheckCameraOpenerDefault(
        openCameraUseCase: new OpenCameraUseCaseDefault(new ChannelRepositoryDefault(new ChannelUnicoDefault())),
        openCameraRequest: new OpenCameraRequest(),
        unicoConfig: _unicoConfig,
        autoCaptrue: _autoCaptrue,
        smartFrame: _smartFrame,
    );
  }

  @override
  UnicoCheckBuilder setAutoCapture({required bool autoCaptrue}) {
    _autoCaptrue = autoCaptrue;
    return this;
  }

  @override
  UnicoCheckBuilder setSmartFrame({required bool smartFrame}) {
    _smartFrame = smartFrame;
    return this;
  }

  @override
  UnicoCheckBuilder setTheme({required UnicoConfig unicoConfig}) {
    _unicoConfig = unicoConfig;
    return this;
  }

  @override
  UnicoCheckBuilder setTimeoutSession({required double timeoutSession}) {
    _timeoutSession = timeoutSession;
    return this;
  }
}
