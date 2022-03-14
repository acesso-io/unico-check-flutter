import 'package:unico_check/src/clean/api/unico.check.builder.dart';
import 'package:unico_check/src/clean/api/unico.check.camera.impl.dart';
import 'package:unico_check/src/clean/data/repository/channel.repository.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/usecase/open.camera.impl.dart';
import 'package:unico_check/src/clean/plugins/channel/channel.unico.source.dart';
import 'camera/unico.check.camera.opener.dart';

class UnicoCheck extends UnicoCheckBuilder {

  late UnicoConfig _unicoConfig;
  late bool _autoCaptrue = true;
  late bool _smartFrame = true;

  @override
  UnicoCheckCameraOpener build() {
    return new UnicoCheckImpl(
        openCamera: new OpenCameraImpl(new ChannelRepository(new ChannelUnicoSource())),
        openCameraRequest: new OpenCameraRequest(),
        unicoConfig: _unicoConfig,
        autoCaptrue: _autoCaptrue,
        smartFrame: _smartFrame
    );
  }

  @override
  UnicoCheckBuilder setAutoCapture({ required bool autoCaptrue }) {
    _autoCaptrue = autoCaptrue;
    return this;
  }

  @override
  UnicoCheckBuilder setSmartFrame({ required bool smartFrame}) {
    _smartFrame = smartFrame;
    return this;
  }

  @override
  UnicoCheckBuilder setTheme({required UnicoConfig unicoConfig}) {
    _unicoConfig = unicoConfig;
    return this;
  }

  @override
  UnicoCheckBuilder setTimeoutSession() {
    return this;
  }
}
