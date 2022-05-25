import 'package:unico_check/src/clean/adapter/repository/channel.result.listener.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.channel.dart';
import 'package:unico_check/src/clean/domain/interface/channel.repository.result.listener.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/entities/result.camera.dart';
import 'package:unico_check/src/clean/domain/interface/channel.repository.dart';
import 'package:unico_check/src/clean/adapter/repository/plugin/channel.unico.dart';

class ChannelRepositoryDefault extends ChannelRepository
    implements ChannelResultListener {
  late ChannelUnico _channelUnico;
  static const String error = "repository error";

  late ChannelRepositoryResultListener _channelRepositoryResultListener;

  ChannelRepositoryDefault(ChannelUnico channelUnico) {
    _channelUnico = channelUnico;
  }

  @override
  void callMethodOpenCamera(
      {required String method,
      required OpenCameraRequest cameraRequest,
      required ChannelRepositoryResultListener
          channelRepositoryResultListener}) {
    _channelUnico.callMethod(
        method: method,
        request: cameraRequest.getOpenCameraRequest,
        listener: this);
    _channelRepositoryResultListener = channelRepositoryResultListener;
  }

  @override
  void onChannelResult(Map<dynamic, dynamic> result) {
    try {
      if (result[ChannelRepositoryResultListener.response]) {
        _channelRepositoryResultListener
            .onSuccessChannelResult(onSuccess(result));
      } else {
        _channelRepositoryResultListener.onErrorChannelResult(onError(result));
      }
    } catch (exception) {
      _channelRepositoryResultListener
          .onErrorChannelResult(UnicoErrorChannel(0, error, ""));
    }
  }

  ResultCamera onSuccess(Map result) {
    return ResultCamera(
        result[ResultCamera.map_base64], result[ResultCamera.map_encrypted]);
  }

  UnicoErrorChannel? onError(Map result) {
    try {
      var unicoErrorMap = result[UnicoErrorChannel.unicoError];
      if (unicoErrorMap != "" && unicoErrorMap != null) {
        return UnicoErrorChannel(
            unicoErrorMap[UnicoErrorChannel.map_code],
            unicoErrorMap[UnicoErrorChannel.map_description],
            result[UnicoErrorChannel.errorMethod]);
      } else if (result[UnicoErrorChannel.errorMethod] != null &&
          result[UnicoErrorChannel.errorMethod] != "") {
        return UnicoErrorChannel(
            null, null, result[UnicoErrorChannel.errorMethod]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
