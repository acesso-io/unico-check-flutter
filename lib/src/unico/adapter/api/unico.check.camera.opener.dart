import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/domain/entities/document.type.dart';

abstract class UnicoCheckCameraOpener {
  void openCameraSelfie({required UnicoSelfie listener});

  void openCameraDocument(
      {required DocumentType documentType, required UnicoDocument listener});
}