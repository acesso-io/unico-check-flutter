import 'package:unico_check/src/unico/abstractions/use_case.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/camera_callback/camera.callback.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/error.method.name.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/mapper/unico.error.factory.dart';

class UnicoCallBackUseCase
    implements UseCase<void, CameraCallbackConfingEntity> {
  final UnicoErrorFactory unicoErrorMapper;
  static const String unknownError = "unknown error";
  static const int unknownCode = 999;

  late UnicoErrorChannel? _unicoError;
  late UnicoListener _unicoListener;
  late UnicoSelfie? _listenerSelfie;
  late UnicoDocument? _listenerDocument;

  UnicoCallBackUseCase(this.unicoErrorMapper);

  @override
  void call(CameraCallbackConfingEntity param) {
    _unicoError = param.unicoError;
    _unicoListener = param.unicoListener;
    _listenerSelfie = param.listenerSelfie;
    _listenerDocument = param.listenerDocument;

    _verifyError();
  }

  _verifyError() {
    if (_unicoError != null &&
        _unicoError?.methodName != null &&
        _unicoError?.methodName != "") {
      _errorCallBackWithName(_unicoError!.methodName!);
    } else {
      _unicoListener.onErrorUnico(
          unicoErrorMapper.buildUnicoError(unknownCode, unknownError));
    }
  }

  _errorCallBackWithName(String methodName) {
    try {
      switch (methodName) {
        case ErrorMethodName.onCameraFailedPrepare:
        case ErrorMethodName.onErrorUnico:
        case ErrorMethodName.onErrorJsonFileName:
          _onErrorUnico();
          break;
        case ErrorMethodName.onUserClosedCameraManually:
          _unicoListener.onUserClosedCameraManually();
          break;
        case ErrorMethodName.onSystemClosedCameraTimeoutSession:
          _unicoListener.onSystemClosedCameraTimeoutSession();
          break;
        case ErrorMethodName.onSystemChangedTypeCameraTimeoutFaceInference:
          _unicoListener.onSystemChangedTypeCameraTimeoutFaceInference();
          break;
        case ErrorMethodName.onErrorSelfie:
          _onErrorSelfie();
          break;
        case ErrorMethodName.onErrorDocument:
          _onErrorDocument();
          break;
      }
    } catch (exception) {
      _unicoListener.onErrorUnico(
          unicoErrorMapper.buildUnicoError(unknownCode, unknownError));
    }
  }

  _onErrorUnico() {
    _unicoListener.onErrorUnico(unicoErrorMapper.buildUnicoError(
      _unicoError?.code ?? unknownCode,
      _unicoError?.description ?? unknownError,
    ));
  }

  _onErrorSelfie() {
    _listenerSelfie?.onErrorSelfie(unicoErrorMapper.buildUnicoError(
      _unicoError?.code ?? unknownCode,
      _unicoError?.description ?? 'Selfie error',
    ));
  }

  _onErrorDocument() {
    _listenerDocument?.onErrorDocument(unicoErrorMapper.buildUnicoError(
      _unicoError?.code ?? unknownCode,
      _unicoError?.description ?? 'Document error',
    ));
  }
}
