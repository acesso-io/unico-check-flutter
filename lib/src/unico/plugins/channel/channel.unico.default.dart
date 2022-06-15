import 'package:flutter/services.dart';
import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.result.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

class ChannelUnicoDefault extends ChannelUnico {
  static const String _resultName = 'call_result';

  ChannelResultListener? _listener;
  final MethodChannel _channel;

  ChannelUnicoDefault(this._channel);

  @override
  void callMethod({
    required String method,
    required Map<dynamic, dynamic> request,
    required ChannelResultListener listener,
  }) async {
    try {
      _listener = listener;
      _channel.setMethodCallHandler(_fromNative);
      _channel
          .invokeMethod(
            method,
            request,
          )
          .then((value) => {_listener?.onChannelResult(value)})
          .catchError((error) => {
                listener.onChannelResult(<dynamic, dynamic>{
                  IOpenCameraeListener.response: false,
                  UnicoErrorChannel.errorMethod: error.code,
                  UnicoErrorChannel.unicoError: error.details,
                })
              });
    } on PlatformException catch (e) {
      _listener?.onChannelResult(<dynamic, dynamic>{
        IOpenCameraeListener.response: false,
        UnicoErrorChannel.errorMethod: e.code,
        UnicoErrorChannel.unicoError: e.details,
      });
    }
  }

  Future<void> _fromNative(MethodCall call) async {
    if (call.method == _resultName) {
      _listener?.onChannelResult(<dynamic, dynamic>{
        IOpenCameraeListener.response: false,
        UnicoErrorChannel.errorMethod:
            call.arguments[UnicoErrorChannel.errorMethod],
      });
    }
  }
}
