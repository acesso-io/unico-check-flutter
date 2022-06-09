import 'package:unico_check/src/unico/adapter/repository/channel.result.listener.dart';

abstract class ChannelUnico {
  void callMethod(
      {required String method,
      required Map<dynamic, dynamic> request,
      required ChannelResultListener listener});
}
