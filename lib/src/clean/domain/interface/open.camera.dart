import 'package:unico_check/src/clean/domain/entities/methods.channel.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';

import '../entities/result.camera.selfie.dart';

abstract class OpenCamera {
  // void openCamera(
  //     {required MethodsChannel method, required OpenCameraRequest request});
  ResultCameraSelfie openCamera(
      {required MethodsChannel method, required OpenCameraRequest request});
}
