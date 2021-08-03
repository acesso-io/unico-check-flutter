import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_camera.interface.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/core/response/error/error_bio.response.dart';
import 'package:unico_check/src/core/response/success/camera.response.dart';
import 'package:unico_check/src/core/response/validate_response.dart';

import '../unico_config.dart';

class CameraFunctions {
  final MethodChannel _channel;
  final UnicoConfig _config;
  final IAcessoBioCamera _callbacks;

  bool _disableAutoCapture = false;
  bool _disableSmartFrame = false;

  CameraFunctions({
    required MethodChannel channel,
    required UnicoConfig config,
    required IAcessoBioCamera callbacks,
  })   : _channel = channel,
        _config = config,
        _callbacks = callbacks;

  ///metodo para desabilitar a auto captura
  void disableAutoCapture() {
    _disableAutoCapture = true;
  }

  ///método para desabilitar o smart frame da camera
  void disableSmartFrame() {
    _disableSmartFrame = true;
  }

  ///método responsavel pela abertura da camera e retorno dos dados
  void openCamera() async {
    var map = _config.getCommonMap;
    map[MapConstants.disableAutoCapture] = _disableAutoCapture;
    map[MapConstants.disableSmartFrame] = _disableSmartFrame;

    final result = Map<String, dynamic>.from(
      await _channel.invokeMethod(
        MethodsChannelsConstants.openCamera,
        map,
      ),
    );

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = CameraResponse.fromJson(result);
        _callbacks.onSuccessCamera(response);
      } else {
        final error = ErrorBioResponse(result);
        _callbacks.onErrorCamera((error));
      }
    }
  }
}
