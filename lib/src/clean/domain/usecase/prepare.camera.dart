import 'package:unico_check/src/clean/data/repository/channel.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.prepare.camera.dart';

class PrepareCamera {
  late Channel _channel;

  PrepareCamera(Channel channel) {
    _channel = channel;
  }

  Future<Map<String, dynamic>> prepareCamera(
      {required MethodsConstantsPrepareCamera method, required String request}) {
    return _channel.callMethod(method: method.name, request: request);
  }
}
