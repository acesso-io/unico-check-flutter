import 'package:flutter/services.dart';
import 'channel.unico.dart';

class ChannelUnicoSource extends ChannelUnico {
  static const _channel = MethodChannel('unico');
  static const _value = 'request';

  Future<Map<String, dynamic>> callMethod({required String method, required String request}) async {
    try {
      return Map<String, dynamic>.from(
        await _channel.invokeMethod(
          method,
          <String, String>{_value: request},
        ),
      );
    } on PlatformException catch (exeption) {
      return <String, dynamic>{
        'code': exeption.code,
        'message': exeption.message,
        'details': exeption.details,
        'stacktrace': exeption.stacktrace
      };
    }
  }
}
