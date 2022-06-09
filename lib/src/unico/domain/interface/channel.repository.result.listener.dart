import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

abstract class ChannelRepositoryResultListener {
  static const String response = "status";

  void onSuccessChannelResult(ResultCamera result);

  void onErrorChannelResult(UnicoErrorChannel? result);
}
