import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.default.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.listener.dart';

import 'test_helpers.dart';

void main() {
  ChannelRepository channel = ChannelRepositoryMock();
  OpenCameraUseCaseListener openCameraUseCaseListener =
  OpenCameraUseCaseListenerMock();

  var method = "open_camera_selfie";
  var cameraRequest = new OpenCameraRequest();
  var openCameraUseCaseDefault = OpenCameraUseCaseDefault(channel);

  test('open_camera_should_call_channel', () {

    openCameraUseCaseDefault.openCamera(
        request: cameraRequest,
        methodsChannel: MethodsChannel.open_camera_selfie,
        openCameraUseCaseListener: openCameraUseCaseListener);

    verify(channel.callMethodOpenCamera(
            method: method,
            cameraRequest: cameraRequest,
            channelRepositoryResultListener: openCameraUseCaseDefault))
        .called(1);
  });

  test('open_camera_should_return_success', () {

  });
}
