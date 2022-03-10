import 'package:unico_check/src/clean/data/repository/channel.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.open.camera.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.prepare.camera.dart';

class OpenCamera {
  late Channel _channel;

  OpenCamera(Channel channel) {
    _channel = channel;
  }

  Future<Map<String, dynamic>> openCamera(
      {required MethodsConstantsOpenCamera method, required String request}) {
    return _channel.callMethod(method: method.name, request: request);
  }
}
