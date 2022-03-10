import 'package:unico_check/src/clean/api/camera/document/unico.document.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';

abstract class UnicoCheckCameraOpenerDocument {
  void open(DocumentType documentType, UnicoDocument listener);
}
