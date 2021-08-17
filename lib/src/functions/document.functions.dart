import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_document.interface.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/core/constants/response_contants.dart';
import 'package:unico_check/src/core/response/success/camera_document.response.dart';
import 'package:unico_check/src/core/response/validate_response.dart';

import '../unico_config.dart';

class DocumentFunctions {
  final MethodChannel _channel;
  final UnicoConfig _config;
  final IAcessoBioDocument _callbacks;

  const DocumentFunctions({
    required MethodChannel channel,
    required UnicoConfig config,
    required IAcessoBioDocument callbacks,
  })   : _channel = channel,
        _config = config,
        _callbacks = callbacks;

  ///método responsavel pela abertura da camera e retorno dos dados
  void openCameraDocument({required int documentType}) async {
    final map = _config.getCommonMap;

    map[MapConstants.documentType] = documentType;

    try {
      final result = Map<String, dynamic>.from(
        await _channel.invokeMethod(
          MethodsChannelsConstants.openCameraDocument,
          map,
        ),
      );

      final response = CameraDocumentResponse.fromJson(result);
      _callbacks.onSuccesstDocument(response);
    } on PlatformException catch (exeption) {
      if (exeption.code == ResponseConstants.onError) {
        _callbacks.onErrorDocument(exeption.details);
      }
      validateResponse(callbacks: _callbacks, response: exeption);
    }
  }
}
