import 'package:unico_check/src/clean/api/camera/document/unico.document.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.open.camera.dart';

abstract class UnicoCheckCameraOpenerDocument {
  void open(MethodsConstantsOpenCamera documentType, UnicoDocument listener);
}
