import 'package:unico_check/src/unico/domain/entities/unico.error.dart';

class UnicoErrorFactory {
  UnicoError buildUnicoError(int code, String description) {
    return UnicoError(code, description);
  }
}
