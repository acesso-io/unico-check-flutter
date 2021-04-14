import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_liveness.interface.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/core/response/error/error_bio.response.dart';
import 'package:unico_check/src/core/response/success/liveness_x.response.dart';
import 'package:unico_check/src/core/response/validate_response.dart';

import '../unico_config.dart';

class LivenessFunctions {
  final MethodChannel _channel;
  final UnicoConfig _config;
  final IAcessoBioLiveness _callbacks;

  const LivenessFunctions({
    required MethodChannel channel,
    required UnicoConfig config,
    required IAcessoBioLiveness callbacks,
  })   : _channel = channel,
        _config = config,
        _callbacks = callbacks;

  void openLiveness() async {
    final result = await _channel.invokeMethod(
      MethodsChannelsConstants.openLiveness,
      _config.getCommonMap,
    ) as Map<String, dynamic>;

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = LivenessXResponse.fromJson(result);
        _callbacks.onSuccessLiveness(response);
      } else {
        final error = ErrorBioResponse(result);
        _callbacks.onErrorLiveness(error);
      }
    }
  }

  void openLivenessWithCreateProcess({
    required String name,
    required String document,
  }) async {
    final map = _config.getCommonMap;

    map[MapConstants.name] = name;
    map[MapConstants.document] = document;

    final result = await _channel.invokeMethod(
      MethodsChannelsConstants.openLivenessWithCreateProcess,
      map,
    ) as Map<String, dynamic>;

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = LivenessXResponse.fromJson(result);
        _callbacks.onSuccessLiveness(response);
      } else {
        final error = ErrorBioResponse(result);
        _callbacks.onErrorLiveness(error);
      }
    }
  }
}
