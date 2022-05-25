import 'package:unico_check/src/clean/domain/entities/result.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.channel.dart';

abstract class OpenCameraUseCaseListener {
  void onSuccessOpenCamera(ResultCamera result);

  void onErrorOpenCamera(UnicoErrorChannel? result);
}
