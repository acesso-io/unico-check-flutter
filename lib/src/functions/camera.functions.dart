import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_camera.interface.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/core/constants/response_contants.dart';
import 'package:unico_check/src/core/response/success/camera.response.dart';
import 'package:unico_check/src/core/response/validate_response.dart';

import '../../unico_check.dart';
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
  void setAutoCapture(bool type) {
    _disableAutoCapture = type;
  }

  ///método para desabilitar o smart frame da camera
  void setSmartFrame(bool type) {
    _disableSmartFrame = type;
  }

  ///método responsavel pela abertura da camera e retorno dos dados
  void openCamera() async {
    var map = _config.getCommonMap;
    map[MapConstants.disableAutoCapture] = _disableAutoCapture;
    map[MapConstants.disableSmartFrame] = _disableSmartFrame;

    try {
      final result = Map<String, dynamic>.from(
        await _channel.invokeMethod(
          MethodsChannelsConstants.openCamera,
          map,
        ),
      );

      final response = CameraResponse.fromJson(result);
      _callbacks.onSuccessCamera(response);
    } on PlatformException catch (exeption) {
      if (exeption.code == ResponseConstants.onError) {
        final error = ErrorBioResponse(exeption.details);
        _callbacks.onErrorCamera((error));
      } else {
        validateResponse(callbacks: _callbacks, response: exeption);
      }
    }
  }
}
