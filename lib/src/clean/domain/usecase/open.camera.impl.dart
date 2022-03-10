import 'package:unico_check/src/clean/data/repository/channel.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.open.camera.dart';
import 'package:unico_check/src/clean/domain/interface/open.camera.dart';

class OpenCameraImpl extends OpenCamera{
  late Channel _channel;

  OpenCameraImpl(Channel channel) {
    _channel = channel;
  }

  void openCamera(
      {required MethodsConstantsOpenCamera method, required String request}) {
    return _channel.callMethodOpenCamera(method: method.name, request: request);
  }
}
