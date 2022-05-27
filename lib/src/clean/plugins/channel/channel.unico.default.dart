import 'package:flutter/services.dart';
import 'package:unico_check/src/clean/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/clean/adapter/repository/channel.result.listener.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/clean/domain/interface/channel.repository.result.listener.dart';

class ChannelUnicoDefault extends ChannelUnico {
  static const String _resultName = 'call_result';
  static const _channel = const MethodChannel('unico_channel');
  late ChannelResultListener _listener;

  @override
  void callMethod(
      {required String method,
      required Map<dynamic, dynamic> request,
      required ChannelResultListener listener}) async {
    try {
      _listener = listener;
      _channel.setMethodCallHandler(_fromNative);
      _channel
          .invokeMethod(
            method,
            request,
          )
          .then((value) => {_listener.onChannelResult(value)})
          .catchError((error) => {
                listener.onChannelResult(<dynamic, dynamic>{
                  ChannelRepositoryResultListener.response: false,
                  UnicoErrorChannel.errorMethod: error.code,
                  UnicoErrorChannel.unicoError: error.details,
                })
              });
    } on PlatformException catch (e) {
      _listener.onChannelResult(<dynamic, dynamic>{
        ChannelRepositoryResultListener.response: false,
        UnicoErrorChannel.errorMethod: e.code,
        UnicoErrorChannel.unicoError: e.details,
      });
    }
  }

  Future<void> _fromNative(MethodCall call) async {
    if (call.method == _resultName) {
      _listener.onChannelResult(<dynamic, dynamic>{
        ChannelRepositoryResultListener.response: false,
        UnicoErrorChannel.errorMethod:
            call.arguments[UnicoErrorChannel.errorMethod],
      });
    }
  }
}
