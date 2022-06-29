import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/camera_callback/camera.callback.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/error.method.name.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/mapper/unico.error.factory.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';

import '../../../test_dummy.dart';

class MockUnicoListener extends Mock implements UnicoListener {}

class MockUnicoSelfie extends Mock implements UnicoSelfie {}

class MockUnicoDocument extends Mock implements UnicoDocument {}

void main() {
  late UnicoErrorFactory unicoErrorMapper;
  late UnicoCallBackUseCase useCase;

  setUp(() {
    unicoErrorMapper = MockUnicoErrorMapper();
    useCase = UnicoCallBackUseCase(unicoErrorMapper);
  });

  test(
    'should invoke error callback listener when UnicoErrorChannel is null',
    () {
      final unicoListener = MockUnicoListener();

      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: null,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoErrorMapper.buildUnicoError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.buildUnicoError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onCameraFailedPrepare',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onCameraFailedPrepare,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: unicoError,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onErrorUnico',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onErrorUnico,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: unicoError,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onErrorJsonFileName',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onErrorJsonFileName,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: unicoError,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onUserClosedCameraManually',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onUserClosedCameraManually,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: unicoError,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoListener.onUserClosedCameraManually())
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoListener.onUserClosedCameraManually()).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onSystemClosedCameraTimeoutSession',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onSystemClosedCameraTimeoutSession,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: unicoError,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoListener.onSystemClosedCameraTimeoutSession())
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoListener.onSystemClosedCameraTimeoutSession())
          .called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onSystemChangedTypeCameraTimeoutFaceInference',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onSystemChangedTypeCameraTimeoutFaceInference,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: unicoError,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoListener.onSystemChangedTypeCameraTimeoutFaceInference())
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() =>
              unicoListener.onSystemChangedTypeCameraTimeoutFaceInference())
          .called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onErrorSelfie',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoSelfie = MockUnicoSelfie();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onErrorSelfie,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
          unicoError: unicoError,
          unicoListener: unicoListener,
          listenerSelfie: unicoSelfie);
      //  Given
      when(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoSelfie.onErrorSelfie(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoSelfie.onErrorSelfie(dummyUnicoError)).called(1);
      verifyNever(() => unicoListener.onErrorUnico(dummyUnicoError));
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onErrorDocument',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoDocument = MockUnicoDocument();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onErrorDocument,
      );

      final callbackConfingEntity = CameraCallbackConfingEntity(
          unicoError: unicoError,
          unicoListener: unicoListener,
          listenerDocument: unicoDocument);
      //  Given
      when(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoDocument.onErrorDocument(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoDocument.onErrorDocument(dummyUnicoError)).called(1);
      verifyNever(() => unicoListener.onErrorUnico(dummyUnicoError));
    },
  );

  test(
    'should invoke error callback listener when get excepiton',
    () {
      const errorName = 'my_error';
      const errorCode = 0;
      final unicoListener = MockUnicoListener();
      final unicoError = UnicoErrorChannel(
        errorCode,
        errorName,
        ErrorMethodName.onCameraFailedPrepare,
      );
      final callbackConfingEntity = CameraCallbackConfingEntity(
        unicoError: unicoError,
        unicoListener: unicoListener,
      );
      //  Given
      when(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).thenThrow(dummyException);
      when(() => unicoErrorMapper.buildUnicoError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.buildUnicoError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoErrorMapper.buildUnicoError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );
}
