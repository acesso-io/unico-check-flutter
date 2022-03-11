import 'package:unico_check/src/clean/data/repository/channel.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.prepare.camera.dart';
import 'package:unico_check/src/clean/domain/entities/prepare.camera.response.dart';
import 'package:unico_check/src/clean/domain/entities/prepare.dart';
import 'package:unico_check/src/clean/domain/interface/prepare.camera.dart';

class PrepareCameraImpl extends PrepareCamera {
  late Channel _channel;

  PrepareCameraImpl(Channel channel) {
    _channel = channel;
  }

  @override
  Future<PrepareCameraResponse> prepareCamera(
      {required MethodsConstantsPrepareCamera method,
      required Prepare prepare}) {

    return _channel.callMethodPrepareCamera(
        method: method.name, prepare: prepare);

  }
}
