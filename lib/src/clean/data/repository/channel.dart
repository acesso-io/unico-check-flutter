
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';

abstract class Channel {
  void callMethodOpenCamera(
      {required String method, required OpenCameraRequest request});
}
