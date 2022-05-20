import 'package:unico_check/src/clean/domain/entities/channel.result.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';

abstract class OpenCameraUseCase {
  Future<ChannelResult> openCamera({required OpenCameraRequest request});
}
