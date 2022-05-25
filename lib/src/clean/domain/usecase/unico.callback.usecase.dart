import 'package:unico_check/src/clean/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/clean/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/clean/adapter/api/unico.listener.dart';
import 'package:unico_check/src/clean/domain/entities/error.method.name.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

class UnicoCallBackUseCase {
  static const String unknownError = "unknown error";
  late UnicoErrorChannel? _unicoError;
  late UnicoListener _unicoListener;
  late UnicoSelfie? _listenerSelfie;
  late UnicoDocument? _listenerDocument;

  void execute(
      {required UnicoErrorChannel? unicoError,
      required UnicoListener unicoListener,
      required UnicoSelfie? listenerSelfie,
      required UnicoDocument? listenerDocument}) {
    _unicoError = unicoError;
    _unicoListener = unicoListener;
    _listenerSelfie = listenerSelfie;
    _listenerDocument = listenerDocument;

    verifyError();
  }

  void verifyError() {
    if (_unicoError != null &&
        _unicoError?.methodName != null &&
        _unicoError?.methodName != "") {
      errorCallBackWithName(_unicoError!.methodName!);
    } else {
      _unicoListener.onErrorAcessoBio(getUnknownError());
    }
  }

  void errorCallBackWithName(String methodName) {
    if (methodName == ErrorMethodName.onCameraFailedPrepare) {
      onErrorUnico();
    } else if (methodName == ErrorMethodName.onErrorUnico) {
      onErrorUnico();
    } else if (methodName == ErrorMethodName.onUserClosedCameraManually) {
      _unicoListener.onUserClosedCameraManually();
    } else if (methodName ==
        ErrorMethodName.onSystemClosedCameraTimeoutSession) {
      _unicoListener.onSystemClosedCameraTimeoutSession();
    } else if (methodName ==
        ErrorMethodName.onSystemChangedTypeCameraTimeoutFaceInference) {
      _unicoListener.onSystemChangedTypeCameraTimeoutFaceInference();
    } else if (methodName == ErrorMethodName.onErrorSelfie) {
      onErrorSelfie();
    } else if (methodName == ErrorMethodName.onErrorDocument) {
      onErrorDocument();
    } else if (methodName == ErrorMethodName.onErrorJsonFileName) {
      onErrorUnico();
    }
  }

  void onErrorUnico() {
    try {
      _unicoListener.onErrorAcessoBio(
          UnicoError(_unicoError!.code!, _unicoError!.description!));
    } catch (exception) {
      _unicoListener.onErrorAcessoBio(getUnknownError());
    }
  }

  void onErrorSelfie() {
    try {
      _listenerSelfie!.onErrorSelfie(
          UnicoError(_unicoError!.code!, _unicoError!.description!));
    } catch (exception) {
      _unicoListener.onErrorAcessoBio(getUnknownError());
    }
  }

  void onErrorDocument() {
    try {
      _listenerDocument!.onErrorDocument(
          UnicoError(_unicoError!.code!, _unicoError!.description!));
    } catch (exception) {
      _unicoListener.onErrorAcessoBio(getUnknownError());
    }
  }

  UnicoError getUnknownError() {
    return new UnicoError(0, unknownError);
  }
}
