import 'package:unico_check/src/clean/domain/entities/prepare.dart';
import 'package:unico_check/src/clean/plugins/channel/channel.unico.dart';
import 'channel.dart';

class CameraFunctions extends Channel {
  late ChannelUnico _channelUnico;

  CameraFunctions(ChannelUnico channelUnico) {
    _channelUnico = channelUnico;
  }

  @override
  void callMethodOpenCamera({required String method, required String request}) {
    // _channelUnico.callMethod(method: method, request: request)
  }

  @override
  void callMethodPrepareCamera({required String method, required Prepare prepare}) {
     _channelUnico.callMethod(method: method, request: prepare.getPrepareCameraMap);
  }
}
