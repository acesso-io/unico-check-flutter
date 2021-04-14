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

  const CameraFunctions({
    required MethodChannel channel,
    required UnicoConfig config,
    required IAcessoBioCamera callbacks,
  })   : _channel = channel,
        _config = config,
        _callbacks = callbacks;

  void openCamera() async {
    final result = await _channel.invokeMethod(
      MethodsChannelsConstants.openCamera,
      _config.getCommonMap,
    ) as Map<String, dynamic>;

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

  void openCameraWithCreateProcess({
    required String nome,
    required String code,
    required String gender,
    required String birthdate,
    required String email,
    required String phone,
  }) async {
    var map = _config.getCommonMap;
    map[MapConstants.nome] = nome;
    map[MapConstants.code] = code;
    map[MapConstants.gender] = gender;
    map[MapConstants.birthdate] = birthdate;
    map[MapConstants.email] = email;
    map[MapConstants.phone] = phone;

    final result = await _channel.invokeMethod(
      MethodsChannelsConstants.openCameraWithCreateProcess,
      map,
    ) as Map<String, dynamic>;

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        final response = CameraResponse.fromJson(result);
        _callbacks.onSuccessCamera(response);
      } else {
        final error = ErrorBioResponse(result);
        _callbacks.onErrorCamera(error);
      }
    }
  }

  void openCameraWithCreateProcessAndInsertDocument({
    required String code,
    required String nome,
    required int documentType,
  }) async {
    var map = _config.getCommonMap;
    map[MapConstants.code] = code;
    map[MapConstants.nome] = nome;
    map[MapConstants.documentType] = documentType;

    final result = await _channel.invokeMethod(
      MethodsChannelsConstants.openCameraInsertDocument,
      map,
    ) as Map<String, dynamic>;

    if (validateResponse(callbacks: _callbacks, response: result)) {
      if (result[MapConstants.flutterStatus] == 1) {
        _callbacks.onSucessDocumentInsert(
          result[MapConstants.processId],
          result[MapConstants.typed],
        );
      } else {
        _callbacks..onErrorDocumentInsert(result['result']);
      }
    }
  }
}
