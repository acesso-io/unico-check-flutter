import 'package:unico_check/src/clean/api/camera/selfie/unico.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'camera/document/unico.document.dart';

abstract class UnicoCheckSelfieCameraOpener {
  void openCameraSelfie(
      {required String jsonFileName, required UnicoSelfie listener});
}
