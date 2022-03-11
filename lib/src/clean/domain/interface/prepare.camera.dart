import 'package:unico_check/src/clean/domain/entities/methods.constants.prepare.camera.dart';
import 'package:unico_check/src/clean/domain/entities/prepare.camera.response.dart';
import 'package:unico_check/src/clean/domain/entities/prepare.dart';

abstract class PrepareCamera {
  Future<PrepareCameraResponse> prepareCamera(
      {required MethodsConstantsPrepareCamera method, required Prepare prepare});
}
