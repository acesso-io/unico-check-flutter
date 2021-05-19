import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_authenticate.interface.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/core/response/error/error_bio.response.dart';
import 'package:unico_check/src/core/response/success/authenticate.response.dart';
import 'package:unico_check/src/core/response/validate_response.dart';

import '../unico_config.dart';

class AuthenticateFunctions {
  final MethodChannel _channel;
  final UnicoConfig _config;
  final IAcessoBioAuthenticate _callbacks;

  const AuthenticateFunctions({
    required MethodChannel channel,
    required UnicoConfig config,
    required IAcessoBioAuthenticate callbacks,
  })   : _channel = channel,
        _config = config,
        _callbacks = callbacks;

  void openAuthenticate({required String code}) async {
    var map = _config.getCommonMap;

    map[MapConstants.code] = code;

    final result = Map<String, dynamic>.from(
      await _channel.invokeMethod(
        MethodsChannelsConstants.openAuthenticate,
        map,
      ),
    );

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = AuthenticateResponse.fromJson(result);
        _callbacks.onSuccessAuthenticate(response);
      } else {
        final error = ErrorBioResponse(result);
        _callbacks.onErrorAuthenticate(error);
      }
    }
  }
}
