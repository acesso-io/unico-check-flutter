import 'package:unico_check/src/clean/domain/entities/channel.result.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/entities/result.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.error.dart';
import 'package:unico_check/src/clean/domain/interface/channel.repository.dart';
import 'package:unico_check/src/clean/adapter/repository/plugin/channel.unico.dart';

class ChannelRepositoryDefault extends ChannelRepository {
  late ChannelUnico _channelUnico;
  static const String error = "repository error";

  ChannelRepositoryDefault(ChannelUnico channelUnico) {
    _channelUnico = channelUnico;
  }

  @override
  Future<ChannelResult> callMethodOpenCamera(
      {required String method, required OpenCameraRequest request}) async {
    try {
      var result = await _channelUnico.callMethod(
          method: method, request: request.getOpenCameraRequest);

      ResultCamera? resultCamera;
      UnicoError? unicoError;

      if (result[ChannelResult.response]) {
        resultCamera = new ResultCamera(result[ResultCamera.map_base64],
            result[ResultCamera.map_encrypted]);
      } else {
        unicoError = new UnicoError(
            result[UnicoError.map_code], result[UnicoError.map_description]);
      }

      return new ChannelResult(resultCamera, unicoError);
    } catch (exeption) {
      return new ChannelResult(null, UnicoError(0, error));
    }
  }
}
