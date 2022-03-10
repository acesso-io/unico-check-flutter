import 'package:unico_check/src/clean/plugins/channel/channel.unico.dart';
import 'channel.dart';

class CameraFunctions extends Channel {
  late ChannelUnico _channelUnico;

  CameraFunctions(ChannelUnico channelUnico) {
    _channelUnico = channelUnico;
  }

  Future<Map<String, dynamic>> callMethod({
    required String method,
    required String request
  }) async {
    return _channelUnico.callMethod(method: method, request: request);
  }
}
