import 'package:unico_check/src/clean/api/camera/selfie/unico.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'document/unico.document.dart';

abstract class UnicoCheckCameraOpener {
  void openCameraSelfie({required String jsonFileName, required UnicoSelfie listener});

  void openCameraDocument({required String jsonFileName, required DocumentType documentType, required UnicoDocument listener});
}
