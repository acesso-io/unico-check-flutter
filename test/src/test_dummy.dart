import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';

// dummies
final dummyUnicoErrorChannel = FakeUnicoErrorChannel();

final exception = Exception();

final dummyUnicoError = FakeUnicoError();

//  Mocks
class MockChannelRepository extends Mock implements ChannelRepository {}

class MockChannelUnico extends Mock implements ChannelUnico {}

class MockCameraResultProcessorMapper extends Mock implements CameraResultProcessorMapper {}

// Fakes
class FakeOpenCameraRequest extends Fake implements OpenCameraRequest {
  @override
  Map<dynamic, dynamic> get getOpenCameraRequest => {};
}

class FakeIOpenCameraeListener extends Fake implements IOpenCameraeListener {}

class FakeResultCamera extends Fake implements ResultCamera {}

class FakeUnicoErrorChannel extends Fake implements UnicoErrorChannel {}

class FakeUnicoError extends Fake implements UnicoError {}
