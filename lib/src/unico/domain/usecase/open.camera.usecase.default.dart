import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.result.listener.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.listener.dart';

class OpenCameraUseCaseDefault extends OpenCameraUseCase
    implements ChannelRepositoryResultListener {
  late ChannelRepository _channel;
  late OpenCameraUseCaseListener _listener;

  OpenCameraUseCaseDefault(ChannelRepository channel) {
    _channel = channel;
  }

  void openCamera(
      {required OpenCameraRequest request,
      required MethodsChannel methodsChannel,
      required OpenCameraUseCaseListener openCameraUseCaseListener}) {
    _channel.callMethodOpenCamera(
        method: methodsChannel.name,
        cameraRequest: request,
        channelRepositoryResultListener: this);
    _listener = openCameraUseCaseListener;
  }

  @override
  void onSuccessChannelResult(ResultCamera result) {
    _listener.onSuccessOpenCamera(result);
  }

  @override
  void onErrorChannelResult(UnicoErrorChannel? result) {
    _listener.onErrorOpenCamera(result);
  }
}