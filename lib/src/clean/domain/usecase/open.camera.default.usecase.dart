import 'package:unico_check/src/clean/domain/entities/channel.result.dart';
import 'package:unico_check/src/clean/domain/entities/methods.channel.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/interface/channel.repository.dart';
import 'package:unico_check/src/clean/domain/usecase/open.camera.usecase.dart';

class OpenCameraUseCaseDefault extends OpenCameraUseCase {
  late ChannelRepository _channel;

  OpenCameraUseCaseDefault(ChannelRepository channel) {
    _channel = channel;
  }

  Future<ChannelResult> openCamera({required OpenCameraRequest request}) {
    return _channel.callMethodOpenCamera(
        method: MethodsChannel.open_camera.name, request: request);
  }
}
