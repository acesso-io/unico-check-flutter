import 'package:flutter/services.dart';
import 'channel.unico.dart';

class ChannelUnicoSource extends ChannelUnico {
  static const _channel = MethodChannel('unico');

  @override
  Future<Map<dynamic, dynamic>> callMethod({required String method, required Map<dynamic, dynamic> request}) async {
    try {
      return Map<String, dynamic>.from(
        await _channel.invokeMethod(
          method,
          request,
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
