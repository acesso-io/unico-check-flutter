import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.listener.dart';

abstract class OpenCameraUseCase {
  void openCamera(
      {required OpenCameraRequest request,
      required MethodsChannel methodsChannel,
      required OpenCameraUseCaseListener openCameraUseCaseListener});
}
