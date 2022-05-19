import 'package:flutter/services.dart';
import 'channel.unico.dart';

class ChannelUnicoSource extends ChannelUnico {
  static const _channel = MethodChannel('acessobio');

  @override
  Future<dynamic> callMethod(
      {required String method, required Map<dynamic, dynamic> request}) async {
    try {
      Map<dynamic, dynamic> newChannel = await _channel.invokeMethod(
        method,
        request,
      );
      return newChannel;
    } on PlatformException catch (exeption) {
      return <dynamic, dynamic>{
        'code': exeption.code,
        'message': exeption.message,
        'details': exeption.details,
        'stacktrace': exeption.stacktrace
      };
    }
  }
}
