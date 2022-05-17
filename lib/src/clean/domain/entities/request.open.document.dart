import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';

class RequestOpenDocument {
  late UnicoConfig _configUnico;
  late String _unicoConfigFileName;
  late DocumentType _documentType;

  void setConfigUnico(UnicoConfig configUnico) {
    _configUnico = configUnico;
  }

  void setConfigUnicoFileName(String unicoConfigFileName) {
    _unicoConfigFileName = unicoConfigFileName;
  }

  void setDocumentType(DocumentType documentType) {
    _documentType = documentType;
  }

  Map<dynamic, dynamic> get requestGETOpenDocument {
    return <dynamic, dynamic>{
      "unico_file_name": _unicoConfigFileName,
      "unico_config": _configUnico,
      "unico_document_type": _documentType,
    };
  }
}
