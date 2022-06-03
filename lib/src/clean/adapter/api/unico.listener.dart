import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class UnicoListener {
  void onErrorUnico(UnicoError error);

  void onUserClosedCameraManually();

  void onSystemClosedCameraTimeoutSession();

  void onSystemChangedTypeCameraTimeoutFaceInference();
}
