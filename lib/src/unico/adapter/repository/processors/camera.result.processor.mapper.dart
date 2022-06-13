import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

class CameraResultProcessorMapper {
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
        return UnicoErrorChannel(null, null, result[UnicoErrorChannel.errorMethod]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  UnicoErrorChannel getDefaultErrorChanel(String message) {
    return UnicoErrorChannel(0, message, "");
  }
}
