import 'package:unico_check/src/unico/abstractions/use_case.dart';
import 'package:unico_check/src/unico/domain/entities/open_camera/open.camera.config.entity.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';

class OpenCameraUseCase implements UseCase<void, OpenCameraConfigEntity> {
  final ChannelRepository _channel;

  OpenCameraUseCase(this._channel);

  @override
  void call(OpenCameraConfigEntity param) {
    _channel.callMethodOpenCamera(
      method: param.methodsChannel.name,
      cameraRequest: param.request,
      openCameraeListener: param.openCameraeListener,
    );
  }
}
