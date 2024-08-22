import 'package:unico_check/src/unico/domain/entities/unico.locale.types.dart';

class UnicoLocaleTypesMapper {
  String map(UnicoLocaleTypes unicoLocaleTypes) {
    if (unicoLocaleTypes == UnicoLocaleTypes.PT_BR) {
      return "PT_BR";
    } else if (unicoLocaleTypes == UnicoLocaleTypes.EN_US) {
      return "EN_US";
    } else if (unicoLocaleTypes == UnicoLocaleTypes.ES_ES) {
      return "ES_ES";
    } else if (unicoLocaleTypes == UnicoLocaleTypes.ES_MX) {
      return "ES_MX";
    } else {
      return "PT_BR";
    }
  }
}
