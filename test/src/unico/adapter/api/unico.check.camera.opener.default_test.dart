import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/adapter/api/mapper/open.check.camera.factory.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.camera.opener.default.dart';
import 'package:unico_check/src/unico/domain/entities/camera_opener/camera.opener.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';
import 'package:unico_check/unico_check.dart';

import '../../../test_dummy.dart';

class MockOpenCameraUseCase extends Mock implements OpenCameraUseCase {}

class MockUnicoCallBackUseCase extends Mock implements UnicoCallBackUseCase {}

class MockOpenCheckCameraFactory extends Mock
    implements OpenCheckCameraFactory {}

void main() {
  final unicoTheme = UnicoTheme();
  final unicoConfigAndroid = MockUnicoConfig();
  final unicoConfigIos = MockUnicoConfig();
  final unicoListener = MockUnicoListener();
  final unicoSelfieListener = MockUnicoSelfie();
  final unicoDocumenListener = MockUnicoDocument();

  final cameraOpenerConfig = CameraOpenerConfigEntity(
    unicoTheme: unicoTheme,
    autoCapture: true,
    smartFrame: true,
    timeoutSession: 0.0,
    unicoConfigAndroid: unicoConfigAndroid,
    unicoConfigIos: unicoConfigIos,
    unicoListener: unicoListener,
  );

  late OpenCameraUseCase openCameraUseCase;
  late OpenCameraRequest openCameraRequest;
  late UnicoCallBackUseCase unicoCallBackUseCase;
  late OpenCheckCameraFactory openCheckCameraFactory;

  late UnicoCheckCameraOpenerDefault cameraOpenerDefault;

  setUp(() {
    openCameraRequest = MockOpenCameraRequest();
    openCameraUseCase = MockOpenCameraUseCase();
    unicoCallBackUseCase = MockUnicoCallBackUseCase();
    openCheckCameraFactory = MockOpenCheckCameraFactory();

    cameraOpenerDefault = UnicoCheckCameraOpenerDefault(
      openCameraUseCase: openCameraUseCase,
      unicoCallBackUseCase: unicoCallBackUseCase,
      openCameraRequest: openCameraRequest,
      cameraOpenerConfig: cameraOpenerConfig,
      openCheckCameraFactory: openCheckCameraFactory,
    );
  });

  test('should open selfie camera when call openCameraSelfie', () {
    final dummyOpenCameraConfigEntity = FakeOpenCameraConfigEntity();
    //  Given
    when(() => openCameraRequest.setAutoCaptrue(cameraOpenerConfig.autoCapture))
        .thenAnswer((invocation) {});
    when(() => openCameraRequest.setSmartFrame(cameraOpenerConfig.smartFrame))
        .thenAnswer((invocation) {});
    when(() => openCameraRequest.setUnicoTheme(cameraOpenerConfig.unicoTheme))
        .thenAnswer((invocation) {});
    when(() => openCameraRequest.setTimeoutSession(
        cameraOpenerConfig.timeoutSession)).thenAnswer((invocation) {});
    when(() => openCameraRequest.setUnicoConfigIos(
        cameraOpenerConfig.unicoConfigIos)).thenAnswer((invocation) {});
    when(() => openCameraRequest.setUnicoConfigAndroid(
        cameraOpenerConfig.unicoConfigAndroid)).thenAnswer((invocation) {});
    when(() => openCheckCameraFactory.buildOpenCameraConfigEntity(
          openCameraRequest,
          MethodsChannel.open_camera_selfie,
          cameraOpenerDefault,
        )).thenAnswer((invocation) => dummyOpenCameraConfigEntity);
    when(() => openCameraUseCase(dummyOpenCameraConfigEntity))
        .thenAnswer((invocation) {});
    //  Wehn
    cameraOpenerDefault.openCameraSelfie(listener: unicoSelfieListener);
    //  Then
    verify(() =>
            openCameraRequest.setAutoCaptrue(cameraOpenerConfig.autoCapture))
        .called(1);
    verify(() => openCameraRequest.setSmartFrame(cameraOpenerConfig.smartFrame))
        .called(1);
    verify(() => openCameraRequest.setUnicoTheme(cameraOpenerConfig.unicoTheme))
        .called(1);
    verify(() => openCameraRequest
        .setTimeoutSession(cameraOpenerConfig.timeoutSession)).called(1);
    verify(() => openCameraRequest
        .setUnicoConfigIos(cameraOpenerConfig.unicoConfigIos)).called(1);
    verify(() => openCameraRequest.setUnicoConfigAndroid(
        cameraOpenerConfig.unicoConfigAndroid)).called(1);
    verify(() => openCheckCameraFactory.buildOpenCameraConfigEntity(
          openCameraRequest,
          MethodsChannel.open_camera_selfie,
          cameraOpenerDefault,
        )).called(1);
    verify(() => openCameraUseCase(dummyOpenCameraConfigEntity)).called(1);
  });

  test('should execute onErrorOpenCamera when retrive error', () {
    final dummyCameraCallbackConfingEntity = MockCameraCallbackConfingEntity();
    when(() => openCheckCameraFactory.buildCameraCallbackConfingEntity(
          unicoError: null,
          unicoListener: cameraOpenerConfig.unicoListener,
          listenerSelfie: null,
          listenerDocument: null,
        )).thenAnswer((invocation) => dummyCameraCallbackConfingEntity);
    when(() => unicoCallBackUseCase(dummyCameraCallbackConfingEntity))
        .thenAnswer((invocation) {});

    cameraOpenerDefault.onErrorOpenCamera(null);

    verify(() => openCheckCameraFactory.buildCameraCallbackConfingEntity(
          unicoError: null,
          unicoListener: cameraOpenerConfig.unicoListener,
          listenerSelfie: null,
          listenerDocument: null,
        )).called(1);
    verify(() => unicoCallBackUseCase(dummyCameraCallbackConfingEntity))
        .called(1);
  });

  test('should open document camera when call openCameraDocument', () {
    final dummyOpenCameraConfigEntity = FakeOpenCameraConfigEntity();
    //  Given
    when(() => openCameraRequest.setDocumentType(DocumentType.CNH))
        .thenAnswer((invocation) {});
    when(() => openCameraRequest.setUnicoTheme(cameraOpenerConfig.unicoTheme))
        .thenAnswer((invocation) {});
    when(() => openCameraRequest.setTimeoutSession(
        cameraOpenerConfig.timeoutSession)).thenAnswer((invocation) {});
    when(() => openCameraRequest.setUnicoConfigIos(
        cameraOpenerConfig.unicoConfigIos)).thenAnswer((invocation) {});
    when(() => openCameraRequest.setUnicoConfigAndroid(
        cameraOpenerConfig.unicoConfigAndroid)).thenAnswer((invocation) {});
    when(() => openCheckCameraFactory.buildOpenCameraConfigEntity(
          openCameraRequest,
          MethodsChannel.open_camera_document,
          cameraOpenerDefault,
        )).thenAnswer((invocation) => dummyOpenCameraConfigEntity);
    when(() => openCameraUseCase(dummyOpenCameraConfigEntity))
        .thenAnswer((invocation) {});
    //  Wehn
    cameraOpenerDefault.openCameraDocument(
        documentType: DocumentType.CNH, listener: unicoDocumenListener);
    //  Then
    verify(() => openCameraRequest.setDocumentType(DocumentType.CNH)).called(1);
    verify(() => openCameraRequest.setUnicoTheme(cameraOpenerConfig.unicoTheme))
        .called(1);
    verify(() => openCameraRequest
        .setTimeoutSession(cameraOpenerConfig.timeoutSession)).called(1);
    verify(() => openCameraRequest
        .setUnicoConfigIos(cameraOpenerConfig.unicoConfigIos)).called(1);
    verify(() => openCameraRequest.setUnicoConfigAndroid(
        cameraOpenerConfig.unicoConfigAndroid)).called(1);
    verify(() => openCheckCameraFactory.buildOpenCameraConfigEntity(
          openCameraRequest,
          MethodsChannel.open_camera_document,
          cameraOpenerDefault,
        )).called(1);
    verify(() => openCameraUseCase(dummyOpenCameraConfigEntity)).called(1);
  });
}
