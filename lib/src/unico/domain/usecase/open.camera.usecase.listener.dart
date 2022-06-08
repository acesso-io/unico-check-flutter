import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

abstract class OpenCameraUseCaseListener {
  void onSuccessOpenCamera(ResultCamera result);

  void onErrorOpenCamera(UnicoErrorChannel? result);
}
