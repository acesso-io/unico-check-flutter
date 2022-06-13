import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.repository.default.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';

import '../../test_dummy.dart';

class MockIOpenCameraeListener extends Mock implements IOpenCameraeListener {}

void main() {
  late ChannelUnico channelUnico;
  late CameraResultProcessorMapper processorMapper;
  late ChannelRepositoryDefault repository;

  setUp(() {
    channelUnico = MockChannelUnico();
    processorMapper = MockCameraResultProcessorMapper();
    repository = ChannelRepositoryDefault(channelUnico, processorMapper);
  });

  group('Channel Repository Open Camera Tests', () {
    test(
        'should call method open_camera_selfie from ChannelUnico when invoke callMethodOpenCamera',
        () {
      final String method = MethodsChannel.open_camera_selfie.name;
      final OpenCameraRequest cameraRequest = FakeOpenCameraRequest();
      final IOpenCameraeListener openCameraeListener = FakeIOpenCameraeListener();
      //  Given
      when(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).thenAnswer((invocation) {});
      //  When
      repository.callMethodOpenCamera(
        method: method,
        cameraRequest: cameraRequest,
        openCameraeListener: openCameraeListener,
      );
      //  Then
      verify(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).called(1);
    });
  });

  group('Camera Result Callback Tests', () {
    test(
        'should get SUCCESS when onChannelResult is trigger and invoke onSuccessOpenCamera from openCameraeListener',
        () {
      final method = MethodsChannel.open_camera_selfie.name;
      final cameraRequest = FakeOpenCameraRequest();
      final openCameraeListener = MockIOpenCameraeListener();
      final Map<dynamic, dynamic> result = {IOpenCameraeListener.response: true};
      final dummyResultCamera = FakeResultCamera();
      //  Given
      when(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).thenAnswer((invocation) {});
      when(() => processorMapper.onSuccess(result)).thenAnswer((_) => dummyResultCamera);
      when(() => openCameraeListener.onSuccessOpenCamera(dummyResultCamera))
          .thenAnswer((invocation) {});
      //  When
      repository.callMethodOpenCamera(
        method: method,
        cameraRequest: cameraRequest,
        openCameraeListener: openCameraeListener,
      );
      repository.onChannelResult(result);
      //  Then
      verify(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).called(1);
      verify(() => processorMapper.onSuccess(result)).called(1);
      verify(() => openCameraeListener.onSuccessOpenCamera(dummyResultCamera)).called(1);
    });

    test(
        'should get FAILURE when onChannelResult is trigger and invoke onErrorOpenCamera from openCameraeListener',
        () {
      final method = MethodsChannel.open_camera_selfie.name;
      final cameraRequest = FakeOpenCameraRequest();
      final openCameraeListener = MockIOpenCameraeListener();
      final Map<dynamic, dynamic> result = {IOpenCameraeListener.response: false};
      //  Given
      when(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).thenAnswer((invocation) {});
      when(() => processorMapper.onError(result))
          .thenAnswer((_) => dummyUnicoErrorChannel);
      when(() => openCameraeListener.onErrorOpenCamera(dummyUnicoErrorChannel))
          .thenAnswer((invocation) {});
      //  When
      repository.callMethodOpenCamera(
        method: method,
        cameraRequest: cameraRequest,
        openCameraeListener: openCameraeListener,
      );
      repository.onChannelResult(result);
      //  Then
      verify(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).called(1);
      verify(() => processorMapper.onError(result)).called(1);
      verify(() => openCameraeListener.onErrorOpenCamera(dummyUnicoErrorChannel))
          .called(1);
    });

    test('should launch Ecxeption when onChannelResult is trigger', () {
      final method = MethodsChannel.open_camera_selfie.name;
      final cameraRequest = FakeOpenCameraRequest();
      final openCameraeListener = MockIOpenCameraeListener();
      final Map<dynamic, dynamic> result = {IOpenCameraeListener.response: true};
      final dummyResultCamera = FakeResultCamera();
      //  Given
      when(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).thenAnswer((invocation) {});
      when(() => processorMapper.onSuccess(result)).thenAnswer((_) => dummyResultCamera);
      when(() => openCameraeListener.onSuccessOpenCamera(dummyResultCamera))
          .thenThrow(exception);
      when(() => processorMapper.getDefaultErrorChanel(ChannelRepositoryDefault.error))
          .thenAnswer((invocation) => dummyUnicoErrorChannel);
      when(() => openCameraeListener.onErrorOpenCamera(dummyUnicoErrorChannel))
          .thenAnswer((invocation) {});
      //  When
      repository.callMethodOpenCamera(
        method: method,
        cameraRequest: cameraRequest,
        openCameraeListener: openCameraeListener,
      );
      repository.onChannelResult(result);
      //  Then
      verify(() => channelUnico.callMethod(
            method: method,
            request: cameraRequest.getOpenCameraRequest,
            listener: repository,
          )).called(1);
      verify(() => processorMapper.onSuccess(result)).called(1);
      verify(() => openCameraeListener.onSuccessOpenCamera(dummyResultCamera)).called(1);
      verify(() => processorMapper.getDefaultErrorChanel(ChannelRepositoryDefault.error))
          .called(1);
      verify(() => openCameraeListener.onErrorOpenCamera(dummyUnicoErrorChannel))
          .called(1);
    });
  });
}
