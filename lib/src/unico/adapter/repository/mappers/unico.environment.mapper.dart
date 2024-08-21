import 'package:unico_check/src/unico/domain/entities/unico.environment.dart';

class UnicoEnvironmentMapper {
  String map(UnicoEnvironment environment) {
    if (environment == UnicoEnvironment.PROD) {
      return "PROD";
    } else if (environment == UnicoEnvironment.UAT) {
      return "UAT";
    } else if (environment == UnicoEnvironment.DEV) {
      return "DEV";
    } else {
      return "PROD";
    }
  }
}
