import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open_camera/open.camera.config.entity.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';

import '../../../test_dummy.dart';

void main() {
  late ChannelRepository _channel;
  late OpenCameraUseCase useCase;

  setUp(() {
    _channel = MockChannelRepository();
    useCase = OpenCameraUseCase(_channel);
  });

  group('Open Camera Use Case Unit Test', () {
    test(
        'should call callMethodOpenCamera from ChannelRepository when call OpenCameraUseCase',
        () async {
      final entity = OpenCameraConfigEntity(
        FakeOpenCameraRequest(),
        MethodsChannel.open_camera_selfie,
        FakeIOpenCameraeListener(),
      );
      //  Given
      when(() => _channel.callMethodOpenCamera(
          method: entity.methodsChannel.name,
          cameraRequest: entity.request,
          openCameraeListener: entity.openCameraeListener));
      //  When
      useCase(entity);
      //  Then
      verify(() => _channel.callMethodOpenCamera(
          method: entity.methodsChannel.name,
          cameraRequest: entity.request,
          openCameraeListener: entity.openCameraeListener)).called(1);
    });
  });
}
