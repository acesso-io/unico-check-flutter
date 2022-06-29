import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.result.listener.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/open.camera.request.mapper.dart';

import 'processors/camera.result.processor.mapper.dart';

class ChannelRepositoryDefault extends ChannelRepository
    implements ChannelResultListener {
  final ChannelUnico channelUnico;
  final CameraResultProcessorMapper processorMapper;
  final OpenCameraRequestMapper openCameraRequestMapper;

  static const String error = "repository error";

  //... Camera listener, is subscribe on callMethodOpenCamera method
  IOpenCameraeListener? _openCameraeListener;

  ChannelRepositoryDefault(
    this.channelUnico,
    this.processorMapper,
    this.openCameraRequestMapper,
  );

  @override
  void callMethodOpenCamera({
    required String method,
    required OpenCameraRequest cameraRequest,
    required IOpenCameraeListener openCameraeListener,
  }) {
    _openCameraeListener = openCameraeListener;
    final request = openCameraRequestMapper.map(cameraRequest);

    channelUnico.callMethod(
      method: method,
      request: request,
      listener: this,
    );
  }

  @override
  void onChannelResult(Map<dynamic, dynamic> result) {
    try {
      if (result[IOpenCameraeListener.response]) {
        _openCameraeListener
            ?.onSuccessOpenCamera(processorMapper.onSuccess(result));
      } else {
        _openCameraeListener
            ?.onErrorOpenCamera(processorMapper.onError(result));
      }
    } catch (exception) {
      _openCameraeListener?.onErrorOpenCamera(
        processorMapper.getDefaultErrorChanel(description: error),
      );
    }
  }
}
