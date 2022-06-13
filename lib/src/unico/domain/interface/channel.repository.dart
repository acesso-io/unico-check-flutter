import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';

abstract class ChannelRepository {
  void callMethodOpenCamera({
    required String method,
    required OpenCameraRequest cameraRequest,
    required IOpenCameraeListener openCameraeListener,
  });
}
