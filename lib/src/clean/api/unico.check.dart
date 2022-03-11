import 'package:unico_check/src/clean/api/unico.check.builder.dart';
import 'package:unico_check/src/clean/api/unico.check.camera.dart';
import 'package:unico_check/src/clean/api/unico.check.camera.impl.dart';
import 'package:unico_check/src/clean/data/repository/channel.repository.dart';
import 'package:unico_check/src/clean/domain/usecase/prepare.camera.impl.dart';
import 'package:unico_check/src/clean/plugins/channel/channel.unico.source.dart';

class UnicoCheck extends UnicoCheckBuilder {

  @override
  UnicoCheckCamera build() {
    return new UnicoCheckImpl(
        new PrepareCameraImpl(new ChannelRepository(new ChannelUnicoSource())));
  }

  @override
  UnicoCheckBuilder setAutoCapture() {
    return this;
  }

  @override
  UnicoCheckBuilder setSmartFrame() {
    return this;
  }

  @override
  UnicoCheckBuilder setTheme() {
    return this;
  }

  @override
  UnicoCheckBuilder setTimeoutSession() {
    return this;
  }
}
