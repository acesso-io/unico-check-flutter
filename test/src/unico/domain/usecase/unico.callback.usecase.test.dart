import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/camera_callback/camera.callback.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/error.method.name.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/mapper/unico_error_mapper.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';

import '../../../test_dummy.dart';

class MockUnicoErrorMapper extends Mock implements UnicoErrorMapper {}

class MockUnicoListener extends Mock implements UnicoListener {}

class MockUnicoSelfie extends Mock implements UnicoSelfie {}

class MockUnicoDocument extends Mock implements UnicoDocument {}

void main() {
  late UnicoErrorMapper unicoErrorMapper;
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
      when(() => unicoErrorMapper.getUnknownError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError)).thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.getUnknownError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onCameraFailedPrepare',
    () {
      final errorName = 'my_error';
      final errorCode = 0;
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
      when(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError)).thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onErrorUnico',
    () {
      final errorName = 'my_error';
      final errorCode = 0;
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
      when(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError)).thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onErrorJsonFileName',
    () {
      final errorName = 'my_error';
      final errorCode = 0;
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
      when(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError)).thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onUserClosedCameraManually',
    () {
      final errorName = 'my_error';
      final errorCode = 0;
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
      when(() => unicoListener.onUserClosedCameraManually()).thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoListener.onUserClosedCameraManually()).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onSystemClosedCameraTimeoutSession',
    () {
      final errorName = 'my_error';
      final errorCode = 0;
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
      verify(() => unicoListener.onSystemClosedCameraTimeoutSession()).called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onSystemChangedTypeCameraTimeoutFaceInference',
    () {
      final errorName = 'my_error';
      final errorCode = 0;
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
      verify(() => unicoListener.onSystemChangedTypeCameraTimeoutFaceInference())
          .called(1);
    },
  );

  test(
    'should invoke error callback listener when ErrorMethodName is onErrorSelfie',
    () {
      final errorName = 'my_error';
      final errorCode = 0;
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
      when(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoSelfie.onErrorSelfie(dummyUnicoError)).thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.getUnknownError(
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
      final errorName = 'my_error';
      final errorCode = 0;
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
      when(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoDocument.onErrorDocument(dummyUnicoError))
          .thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.getUnknownError(
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
      final errorName = 'my_error';
      final errorCode = 0;
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
      when(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).thenThrow(exception);
      when(() => unicoErrorMapper.getUnknownError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).thenAnswer((invocation) => dummyUnicoError);
      when(() => unicoListener.onErrorUnico(dummyUnicoError)).thenAnswer((invocation) {});
      //  When
      useCase(callbackConfingEntity);
      //  Then
      verify(() => unicoErrorMapper.getUnknownError(
            errorCode,
            errorName,
          )).called(1);
      verify(() => unicoErrorMapper.getUnknownError(
            UnicoCallBackUseCase.unknownCode,
            UnicoCallBackUseCase.unknownError,
          )).called(1);
      verify(() => unicoListener.onErrorUnico(dummyUnicoError)).called(1);
    },
  );
}
