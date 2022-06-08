import 'package:unico_check/src/unico/domain/interface/channel.repository.result.listener.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';

abstract class ChannelRepository {
  void callMethodOpenCamera(
      {required String method,
      required OpenCameraRequest cameraRequest,
      required ChannelRepositoryResultListener
          channelRepositoryResultListener});
}
