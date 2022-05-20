import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

abstract class UnicoDocument {
  void onSuccessDocument(String base64);

  void onErrorDocument(UnicoError error);
}