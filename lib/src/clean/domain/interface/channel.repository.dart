import 'package:unico_check/src/clean/domain/entities/channel.result.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';

abstract class ChannelRepository {
  Future<ChannelResult> callMethodOpenCamera(
      {required String method, required OpenCameraRequest request});
}
