import 'package:mockito/mockito.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.result.listener.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.listener.dart';

class ChannelRepositoryMock extends Mock implements ChannelRepository {}
class ChannelRepositoryResultListenerMock extends Mock implements ChannelRepositoryResultListener {}
class OpenCameraUseCaseListenerMock extends Mock implements OpenCameraUseCaseListener {}