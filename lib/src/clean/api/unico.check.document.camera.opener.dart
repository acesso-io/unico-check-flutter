import 'package:unico_check/src/clean/api/camera/document/unico.document.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';

abstract class UnicoCheckDocumentCameraOpener {
  void openCameraDocument(
      {required String jsonFileName,
      required DocumentType documentType,
      required UnicoDocument listener});
}
