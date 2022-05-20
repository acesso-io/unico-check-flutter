import 'package:flutter/services.dart';
import '../../adapter/repository/plugin/channel.unico.dart';

class ChannelUnicoDefault extends ChannelUnico {
  static const _channel = MethodChannel('acessobio');

  @override
  Future<Map<dynamic, dynamic>> callMethod(
      {required String method, required Map<dynamic, dynamic> request}) async {
    try {
      return await _channel.invokeMethod(
        method,
        request,
      );
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
