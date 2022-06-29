import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/domain/entities/document.type.dart';

abstract class UnicoCheckCameraOpener {
  /// Open the selfie camera and receive param to return callback
  void openCameraSelfie({required UnicoSelfie listener});

  /// Open the document camera and receive type of document and param to return callback
  void openCameraDocument(
      {required DocumentType documentType, required UnicoDocument listener});
}
