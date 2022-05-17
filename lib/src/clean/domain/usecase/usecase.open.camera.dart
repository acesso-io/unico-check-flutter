import 'package:unico_check/src/clean/domain/entities/request.open.camera.dart';
import 'package:unico_check/src/clean/domain/entities/result.channel.selfie.open.camera.dart';

abstract class UseCaseOpenCamera {
  Future<ResultChannelSelfieOpenCamera> openCamera(
      {required RequestOpenCamera requestOpenCamera});
}
