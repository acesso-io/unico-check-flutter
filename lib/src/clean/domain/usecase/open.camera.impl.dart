import 'package:unico_check/src/clean/data/repository/channel.dart';
import 'package:unico_check/src/clean/domain/entities/methods.channel.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/entities/result.camera.selfie.dart';
import 'package:unico_check/src/clean/domain/interface/open.camera.dart';

class OpenCameraImpl extends OpenCamera {
  late Channel _channel;

  OpenCameraImpl(Channel channel) {
    _channel = channel;
  }

  // void openCamera(
  //     {required MethodsChannel method, required OpenCameraRequest request}) {
  //   return _channel.callMethodOpenCamera(method: method.name, request: request);
  // }

  ResultCameraSelfie openCamera(
      {required MethodsChannel method, required OpenCameraRequest request}) {
    String openCameraReturn =
        _channel.callMethodOpenCamera(method: method.name, request: request);
    var returnResultCameraSelfie = ResultCameraSelfie(
        base64: openCameraReturn, encrypted: openCameraReturn);
    return returnResultCameraSelfie;
    // return _channel.callMethodOpenCamera(method: method.name, request: request);
  }
}
