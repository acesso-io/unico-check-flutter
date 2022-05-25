import 'package:unico_check/src/clean/domain/entities/methods.channel.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/usecase/open.camera.usecase.listener.dart';

abstract class OpenCameraUseCase {
  void openCamera(
      {required OpenCameraRequest request,
      required MethodsChannel methodsChannel,
      required OpenCameraUseCaseListener openCameraUseCaseListener});
}
