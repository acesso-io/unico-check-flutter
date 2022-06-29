import 'package:unico_check/src/unico/domain/entities/unico.error.dart';

abstract class UnicoListener {
  /// Return error of camera
  void onErrorUnico(UnicoError error);

  /// Return when user close camera manually
  void onUserClosedCameraManually();

  /// Return when system close camera ( setTimeoutSession )
  void onSystemClosedCameraTimeoutSession();

  /// Return when system close camera TimeoutFaceInference
  void onSystemChangedTypeCameraTimeoutFaceInference();
}
