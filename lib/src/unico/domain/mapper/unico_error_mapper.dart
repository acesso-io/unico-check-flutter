import 'package:unico_check/src/unico/domain/entities/unico.error.dart';

class UnicoErrorMapper {
  UnicoError getUnknownError(int code, String description) {
    return UnicoError(code, description);
  }
}
