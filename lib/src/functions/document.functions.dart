import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_document.interface.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/core/response/success/camera_document.response.dart';
import 'package:unico_check/src/core/response/success/facematch.response.dart';
import 'package:unico_check/src/core/response/success/ocr.response.dart';
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

  void openCameraDocumentOCR({required int documentType}) async {
    final map = _config.getCommonMap;
    map[MapConstants.documentType] = documentType;

    final result = Map<String, dynamic>.from(
      await _channel.invokeMethod(
        MethodsChannelsConstants.openCameraDocumentOCR,
        map,
      ),
    );

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = OCRResponse.fromJson(result);
        _callbacks.onSuccessOCR(response);
      } else {
        _callbacks.onErrorOCR(result[MapConstants.result]);
      }
    }
  }

  void openFaceMatch({required int documentType}) async {
    final map = _config.getCommonMap;

    map[MapConstants.documentType] = documentType;

    final result = Map<String, dynamic>.from(
      await _channel.invokeMethod(
        MethodsChannelsConstants.openFaceMatch,
        map,
      ),
    );

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = FacematchResponse.fromJson(result);
        _callbacks.onSuccessFaceMatch(response);
      } else {
        _callbacks.onErrorFaceMatch(result[MapConstants.result]);
      }
    }
  }

  void openCameraDocument({required int documentType}) async {
    final map = _config.getCommonMap;

    map[MapConstants.documentType] = documentType;

    final result = Map<String, dynamic>.from(
      await _channel.invokeMethod(
        MethodsChannelsConstants.openCameraDocument,
        map,
      ),
    );

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = CameraDocumentResponse.fromJson(result);
        _callbacks.onSuccesstDocument(response);
      } else {
        _callbacks.onErrorFaceMatch(result[MapConstants.result]);
      }
    }
  }
}
