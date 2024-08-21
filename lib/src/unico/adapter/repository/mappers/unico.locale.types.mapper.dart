import 'package:unico_check/src/unico/domain/entities/unico.locale.types.dart';

class UnicoLocaleTypesMapper {
  String map(UnicoLocaleTypes unicoLocaleTypes) {
    if (unicoLocaleTypes == UnicoLocaleTypes.PT_BR) {
      return "PT_BR";
    } else if (unicoLocaleTypes == UnicoLocaleTypes.EN_US) {
      return "EN-US";
    } else if (unicoLocaleTypes == UnicoLocaleTypes.ES_ES) {
      return "ES-ES";
    } else if (unicoLocaleTypes == UnicoLocaleTypes.ES_MX) {
      return "ES-MX";
    } else {
      return "PT_BR";
    }
  }
}
