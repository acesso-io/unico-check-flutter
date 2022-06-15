import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

class CameraResultProcessorMapper {
  ResultCamera onSuccess(Map result) {
    return ResultCamera(
      result[ResultCamera.mapBase64],
      result[ResultCamera.mapEncrypted],
    );
  }

  UnicoErrorChannel? onError(Map result) {
    try {
      var unicoErrorMap = result[UnicoErrorChannel.unicoError];

      if (unicoErrorMap != "" && unicoErrorMap != null) {
        return getDefaultErrorChanel(
          code: unicoErrorMap[UnicoErrorChannel.mapCode],
          description: unicoErrorMap[UnicoErrorChannel.mapDescription],
          methodName: result[UnicoErrorChannel.errorMethod],
        );
      }

      if (result[UnicoErrorChannel.errorMethod] != null &&
          result[UnicoErrorChannel.errorMethod] != "") {
        return getDefaultErrorChanel(
          methodName: result[UnicoErrorChannel.errorMethod],
        );
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  UnicoErrorChannel getDefaultErrorChanel({
    int code = 0,
    String description = '',
    String methodName = '',
  }) {
    return UnicoErrorChannel(code, description, methodName);
  }
}
