import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

abstract class IOpenCameraeListener {
  static const String response = "status";

  void onSuccessOpenCamera(ResultCamera result);

  void onErrorOpenCamera(UnicoErrorChannel? result);
}
