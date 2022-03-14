import 'package:unico_check/src/clean/domain/entities/methods.constants.open.camera.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';

abstract class OpenCamera {
  void openCamera(
      {required MethodsConstantsOpenCamera method, required OpenCameraRequest request});
}