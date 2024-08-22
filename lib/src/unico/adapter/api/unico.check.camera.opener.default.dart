import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/api/mapper/open.check.camera.factory.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/domain/entities/camera_opener/camera.opener.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/document.type.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';

import 'unico.check.camera.opener.dart';

class UnicoCheckCameraOpenerDefault extends UnicoCheckCameraOpener
    implements IOpenCameraeListener {
  final OpenCameraUseCase openCameraUseCase;
  final OpenCameraRequest openCameraRequest;
  final CameraOpenerConfigEntity cameraOpenerConfig;
  final UnicoCallBackUseCase unicoCallBackUseCase;
  final OpenCheckCameraFactory openCheckCameraFactory;

  UnicoSelfie? _selfieListener;
  UnicoDocument? _documentListener;

  UnicoCheckCameraOpenerDefault({
    required this.openCameraUseCase,
    required this.openCameraRequest,
    required this.cameraOpenerConfig,
    required this.unicoCallBackUseCase,
    required this.openCheckCameraFactory,
  });

  @override
  void openCameraSelfie({required UnicoSelfie listener}) {
    _buildSelfieRequest(cameraOpenerConfig);
    _buildDefaultRequest(cameraOpenerConfig);

    _selfieListener = listener;

    final configEntity = openCheckCameraFactory.buildOpenCameraConfigEntity(
      openCameraRequest,
      MethodsChannel.open_camera_selfie,
      this,
    );

    openCameraUseCase(configEntity);
  }

  @override
  void onSuccessOpenCamera(ResultCamera result) {
    _selfieListener?.onSuccessSelfie(result);
    _documentListener?.onSuccessDocument(result);
  }

  @override
  void onErrorOpenCamera(UnicoErrorChannel? result) {
    final config = openCheckCameraFactory.buildCameraCallbackConfingEntity(
      unicoError: result,
      unicoListener: cameraOpenerConfig.unicoListener,
      listenerSelfie: _selfieListener,
      listenerDocument: _documentListener,
    );
    unicoCallBackUseCase(config);
  }

  @override
  void openCameraDocument({
    required DocumentType documentType,
    required UnicoDocument listener,
  }) {
    _buildDocumentRequest(documentType);
    _buildDefaultRequest(cameraOpenerConfig);

    _documentListener = listener;

    final configEntity = openCheckCameraFactory.buildOpenCameraConfigEntity(
      openCameraRequest,
      MethodsChannel.open_camera_document,
      this,
    );

    openCameraUseCase(configEntity);
  }

  void _buildSelfieRequest(CameraOpenerConfigEntity cameraOpenerConfig) {
    openCameraRequest
      ..setAutoCaptrue(cameraOpenerConfig.autoCapture)
      ..setSmartFrame(cameraOpenerConfig.smartFrame);
  }

  void _buildDefaultRequest(CameraOpenerConfigEntity cameraOpenerConfig) {
    openCameraRequest
      ..setUnicoTheme(cameraOpenerConfig.unicoTheme)
      ..setTimeoutSession(cameraOpenerConfig.timeoutSession)
      ..setLocaleTypes(cameraOpenerConfig.localeTypes)
      ..setEnvironment(cameraOpenerConfig.environment)
      ..setUnicoConfigIos(cameraOpenerConfig.unicoConfigIos)
      ..setUnicoConfigAndroid(cameraOpenerConfig.unicoConfigAndroid);
  }

  void _buildDocumentRequest(DocumentType documentType) {
    openCameraRequest.setDocumentType(documentType);
  }
}
