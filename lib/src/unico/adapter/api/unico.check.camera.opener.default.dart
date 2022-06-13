import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/camera_callback/camera.callback.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/document.type.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/open_camera/open.camera.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';

import 'unico.check.camera.opener.dart';

class UnicoCheckCameraOpenerDefault extends UnicoCheckCameraOpener
    implements IOpenCameraeListener {
  late OpenCameraUseCase _openCameraUseCase;
  late OpenCameraRequest _openCameraRequest;
  late UnicoTheme _unicoTheme;
  late bool _autoCapture;
  late bool _smartFrame;
  late double _timeoutSession;
  late UnicoListener _unicoListener;
  UnicoSelfie? _selfieListener;
  UnicoDocument? _documentListener;
  late UnicoCallBackUseCase _unicoCallBackUseCase;
  late UnicoConfig _unicoConfigIos;

  UnicoCheckCameraOpenerDefault(
      {required OpenCameraUseCase openCameraUseCase,
      required OpenCameraRequest openCameraRequest,
      required UnicoTheme unicoTheme,
      required bool autoCapture,
      required bool smartFrame,
      required UnicoListener unicoListener,
      required UnicoCallBackUseCase unicoCallBackUseCase,
      required double timeoutSession,
      required UnicoConfig unicoConfigIos}) {
    _openCameraUseCase = openCameraUseCase;
    _openCameraRequest = openCameraRequest;
    _unicoTheme = unicoTheme;
    _autoCapture = autoCapture;
    _smartFrame = smartFrame;
    _unicoListener = unicoListener;
    _unicoCallBackUseCase = unicoCallBackUseCase;
    _timeoutSession = timeoutSession;
    _unicoConfigIos = unicoConfigIos;
  }

  @override
  void openCameraSelfie({required String jsonFileName, required UnicoSelfie listener}) {
    buildSelfieRequest();
    buildDefaultRequest(jsonFileName);

    _selfieListener = listener;
    _openCameraUseCase(OpenCameraConfigEntity(
      _openCameraRequest,
      MethodsChannel.open_camera_selfie,
      this,
    ));
  }

  @override
  void onSuccessOpenCamera(ResultCamera result) {
    if (_selfieListener != null) {
      _selfieListener!.onSuccessSelfie(result);
    } else if (_documentListener != null) {
      _documentListener!.onSuccessDocument(result);
    }
  }

  @override
  void onErrorOpenCamera(UnicoErrorChannel? result) {
    final confing = CameraCallbackConfingEntity(
        unicoError: result,
        unicoListener: _unicoListener,
        listenerSelfie: _selfieListener,
        listenerDocument: _documentListener,
    );
    _unicoCallBackUseCase(confing);
  }

  void buildSelfieRequest() {
    _openCameraRequest.setAutoCaptrue(_autoCapture);
    _openCameraRequest.setSmartFrame(_smartFrame);
  }

  void buildDefaultRequest(String jsonFileName) {
    _openCameraRequest.setJsonFilneName(jsonFileName);
    _openCameraRequest.setUnicoTheme(_unicoTheme);
    _openCameraRequest.setTimeoutSession(_timeoutSession);
    _openCameraRequest.setUnicoConfigIos(_unicoConfigIos);
  }

  @override
  void openCameraDocument(
      {required String jsonFileName,
      required DocumentType documentType,
      required UnicoDocument listener}) {
    buildDocumentRequest(documentType);
    buildDefaultRequest(jsonFileName);

    _documentListener = listener;
    _openCameraUseCase(OpenCameraConfigEntity(
      _openCameraRequest,
      MethodsChannel.open_camera_document,
      this,
    ));
  }

  void buildDocumentRequest(DocumentType documentType) {
    _openCameraRequest.setDocumentType(documentType);
  }
}
