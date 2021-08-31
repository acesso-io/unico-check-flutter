import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_listener.interface.dart';
import 'package:unico_check/src/core/constants/response_contants.dart';

import 'error/error_bio.response.dart';

///validaçao de resposta iAccessoBio
void validateResponse({
  required AcessoBioListener callbacks,
  required PlatformException response,
}) {
  if (response.code == ResponseConstants.onErrorAcessoBio) {
    callbacks.onErrorAcessoBio(ErrorBioResponse(response.details));
  } else if (response.code == ResponseConstants.onUserClosedCameraManually) {
    callbacks.onUserClosedCameraManually();
  } else if (response.code ==
      ResponseConstants.onSystemClosedCameraTimeoutSession) {
    callbacks.onSystemClosedCameraTimeoutSession();
  } else if (response.code ==
      ResponseConstants.onSystemChangedTypeCameraTimeoutFaceInference) {
    callbacks.onSystemChangedTypeCameraTimeoutFaceInference();
  } else {
    callbacks.onErrorAcessoBio(ErrorBioResponse(<String, dynamic>{
      'code': 0,
      'method': 'response',
      'description': 'unknown answer',
    }));
  }
}
