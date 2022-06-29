import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';

class OpenCameraConfigEntity {
  final OpenCameraRequest request;
  final MethodsChannel methodsChannel;
  final IOpenCameraeListener openCameraeListener;

  OpenCameraConfigEntity(
      this.request, this.methodsChannel, this.openCameraeListener);
}
