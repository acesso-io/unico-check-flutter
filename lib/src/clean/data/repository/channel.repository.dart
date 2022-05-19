import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/plugins/channel/channel.unico.dart';
import 'channel.dart';

class ChannelRepository extends Channel {
  late ChannelUnico _channelUnico;

  ChannelRepository(ChannelUnico channelUnico) {
    _channelUnico = channelUnico;
  }

  // @override
  // void callMethodOpenCamera(
  //     {required String method, required OpenCameraRequest request}) {
  //   _channelUnico.callMethod(
  //       method: method, request: request.getOpenCameraRequest);
  // }

  @override
  String callMethodOpenCamera(
      {required String method, required OpenCameraRequest request}) {
    String openCameraReturn = _channelUnico.callMethod(
        method: method, request: request.getOpenCameraRequest) as String;
    return openCameraReturn;
  }

  // @override
  // Future<PrepareCameraResponse> callMethodPrepareCamera(
  //     {required String method, required Prepare prepare}) {
  //
  //   Future<Map<dynamic, dynamic>> result = _channelUnico.callMethod(
  //       method: method, request: prepare.getPrepareCameraMap);
  //
  //   return new PrepareCameraResponse().getPrepare(result);
  // }
}
