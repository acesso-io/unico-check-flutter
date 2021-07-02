import 'package:unico_check/src/core/abstracts/acesso_bio.interface.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';

import 'error/error_bio.response.dart';

bool validateResponse({
  required IAcessoBio callbacks,
  required Map<String, dynamic> response,
}) {

  var flutterResult = response[MapConstants.flutterStatus];

  if (flutterResult == 2) {
    final error = ErrorBioResponse(response);
    callbacks.onErrorAcessoBio(error);
    return false;
  } else if (flutterResult == -1) {
    callbacks.userClosedCameraManually();
    return false;
  }  else if (flutterResult == 3) {
    callbacks.systemClosedCameraTimeoutSession();
    return false;
  }else if (flutterResult == 4) {
    callbacks.systemChangedTypeCameraTimeoutFaceInference();
    return false;
  }else {
    return true;
  }
}
