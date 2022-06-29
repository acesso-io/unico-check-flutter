import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.repository.default.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/open.camera.request.mapper.dart';

import '../../test_dummy.dart';

class MockIOpenCameraeListener extends Mock implements IOpenCameraeListener {}

class MockOpenCameraRequestMapper extends Mock
    implements OpenCameraRequestMapper {}

void main() {
  late ChannelUnico channelUnico;
  late CameraResultProcessorMapper processorMapper;
  late ChannelRepositoryDefault repository;
  late OpenCameraRequestMapper requestMapper;

  setUp(() {
    channelUnico = MockChannelUnico();
    processorMapper = MockCameraResultProcessorMapper();
    requestMapper = MockOpenCameraRequestMapper();
    repository = ChannelRepositoryDefault(
      channelUnico,
      processorMapper,
      requestMapper,
    );
  });

  group('Channel Repository Open Camera Tests', () {
    test(
        'should call method open_camera_selfie from ChannelUnico when invoke callMethodOpenCamera',
        () {
      final String method = MethodsChannel.open_camera_selfie.name;
      final OpenCameraRequest cameraRequest = FakeOpenCameraRequest();
      final IOpenCameraeListener openCameraeListener =
          FakeIOpenCameraeListener();
      //  Given
      when(() => requestMapper.map(cameraRequest))
          .thenAnswer((invocation) => dummyMapped);
      when(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
            listener: repository,
          )).thenAnswer((invocation) {});
      //  When
      repository.callMethodOpenCamera(
        method: method,
        cameraRequest: cameraRequest,
        openCameraeListener: openCameraeListener,
      );
      //  Then
      verify(() => requestMapper.map(cameraRequest)).called(1);
      verify(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
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
      final Map<dynamic, dynamic> result = {
        IOpenCameraeListener.response: true
      };
      final dummyResultCamera = FakeResultCamera();
      //  Given
      when(() => requestMapper.map(cameraRequest))
          .thenAnswer((invocation) => dummyMapped);
      when(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
            listener: repository,
          )).thenAnswer((invocation) {});
      when(() => processorMapper.onSuccess(result))
          .thenAnswer((_) => dummyResultCamera);
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
      verify(() => requestMapper.map(cameraRequest)).called(1);
      verify(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
            listener: repository,
          )).called(1);
      verify(() => processorMapper.onSuccess(result)).called(1);
      verify(() => openCameraeListener.onSuccessOpenCamera(dummyResultCamera))
          .called(1);
    });

    test(
        'should get FAILURE when onChannelResult is trigger and invoke onErrorOpenCamera from openCameraeListener',
        () {
      final method = MethodsChannel.open_camera_selfie.name;
      final cameraRequest = FakeOpenCameraRequest();
      final openCameraeListener = MockIOpenCameraeListener();
      final Map<dynamic, dynamic> result = {
        IOpenCameraeListener.response: false
      };
      //  Given
      when(() => requestMapper.map(cameraRequest))
          .thenAnswer((invocation) => dummyMapped);
      when(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
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
      verify(() => requestMapper.map(cameraRequest)).called(1);
      verify(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
            listener: repository,
          )).called(1);
      verify(() => processorMapper.onError(result)).called(1);
      verify(() =>
              openCameraeListener.onErrorOpenCamera(dummyUnicoErrorChannel))
          .called(1);
    });

    test('should launch Ecxeption when onChannelResult is trigger', () {
      final method = MethodsChannel.open_camera_selfie.name;
      final cameraRequest = FakeOpenCameraRequest();
      final openCameraeListener = MockIOpenCameraeListener();
      final Map<dynamic, dynamic> result = {
        IOpenCameraeListener.response: true
      };
      final dummyResultCamera = FakeResultCamera();
      //  Given
      when(() => requestMapper.map(cameraRequest))
          .thenAnswer((invocation) => dummyMapped);
      when(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
            listener: repository,
          )).thenAnswer((invocation) {});
      when(() => processorMapper.onSuccess(result))
          .thenAnswer((_) => dummyResultCamera);
      when(() => openCameraeListener.onSuccessOpenCamera(dummyResultCamera))
          .thenThrow(dummyException);
      when(() => processorMapper.getDefaultErrorChanel(
              description: ChannelRepositoryDefault.error))
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
      verify(() => requestMapper.map(cameraRequest)).called(1);
      verify(() => channelUnico.callMethod(
            method: method,
            request: dummyMapped,
            listener: repository,
          )).called(1);
      verify(() => processorMapper.onSuccess(result)).called(1);
      verify(() => openCameraeListener.onSuccessOpenCamera(dummyResultCamera))
          .called(1);
      verify(() => processorMapper.getDefaultErrorChanel(
          description: ChannelRepositoryDefault.error)).called(1);
      verify(() =>
              openCameraeListener.onErrorOpenCamera(dummyUnicoErrorChannel))
          .called(1);
    });
  });
}
