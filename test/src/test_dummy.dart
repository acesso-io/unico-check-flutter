import 'package:flutter/services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.result.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/camera_callback/camera.callback.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/open_camera/open.camera.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/domain/mapper/unico.error.factory.dart';

// dummies
const dummyString = 'dummyString';

const Map<dynamic, dynamic> dummyMapped = {};

final dummyUnicoErrorChannel = FakeUnicoErrorChannel();

final dummyException = Exception();

final dummyUnicoError = FakeUnicoError();

//  Mocks
class MockChannelRepository extends Mock implements ChannelRepository {}

class MockChannelUnico extends Mock implements ChannelUnico {}

class MockCameraResultProcessorMapper extends Mock
    implements CameraResultProcessorMapper {}

class MockUnicoListener extends Mock implements UnicoListener {}

class MockUnicoSelfie extends Mock implements UnicoSelfie {}

class MockUnicoDocument extends Mock implements UnicoDocument {}

class MockUnicoConfig extends Mock implements UnicoConfig {}

class MockOpenCameraRequest extends Mock implements OpenCameraRequest {}

class MockCameraCallbackConfingEntity extends Mock
    implements CameraCallbackConfingEntity {}

class MockUnicoErrorMapper extends Mock implements UnicoErrorFactory {}

class MockMethodChannel extends Mock implements MethodChannel {}

class MockChannelResultListener extends Mock implements ChannelResultListener {}

class MockUnicoErrorChannel extends Mock implements UnicoErrorChannel {}

class MockIOpenCameraeListener extends Mock implements IOpenCameraeListener {}

// Fakes
class FakeOpenCameraRequest extends Fake implements OpenCameraRequest {}

class FakeIOpenCameraeListener extends Fake implements IOpenCameraeListener {}

class FakeResultCamera extends Fake implements ResultCamera {}

class FakeUnicoErrorChannel extends Fake implements UnicoErrorChannel {}

class FakeUnicoError extends Fake implements UnicoError {}

class FakeOpenCameraConfigEntity extends Fake
    implements OpenCameraConfigEntity {}

class FakePlatformException extends Fake implements PlatformException {
  @override
  final String code = '0';

  @override
  final String details = 'details';
}
