import 'package:unico_check/src/clean/api/response/document/unico.document.dart';
import 'package:unico_check/src/clean/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';


abstract class UnicoCheckCameraOpener {
  void openCameraSelfie({required String jsonFileName, required UnicoSelfie listener});

  void openCameraDocument({required String jsonFileName, required DocumentType documentType, required UnicoDocument listener});
}
