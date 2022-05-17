import 'package:unico_check/src/clean/api/camera/document/unico.document.dart';
import 'package:unico_check/src/clean/api/unico.check.document.camera.opener.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'package:unico_check/src/clean/domain/entities/request.open.document.dart';
import 'package:unico_check/src/clean/domain/entities/result.channel.document.open.camera.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/usecase/usecase.open.document.dart';

class UnicoCheckDefaultDocumentConfigOpener
    extends UnicoCheckDocumentCameraOpener {
  late UseCaseOpenDocument _caseOpenDocument;
  late RequestOpenDocument _requestOpenDocument;
  late UnicoConfig config;
  late DocumentType documentType;

  UnicoCheckDefaultDocumentConfigOpener({
    required UseCaseOpenDocument caseOpenDocument,
    required RequestOpenDocument requestOpenDocument,
    required UnicoConfig config,
    required DocumentType documentType,
  }) {
    _caseOpenDocument = caseOpenDocument;
    _requestOpenDocument = requestOpenDocument;
    config = config;
    documentType = documentType;
  }

  void responseReturn(UnicoDocument listener,
      ResultChannelDocumentOpenCamera resultChannelDocumentOpenCamera) {
    if (resultChannelDocumentOpenCamera.error != null) {
      listener.onSuccessDocument(
          resultChannelDocumentOpenCamera.cameraDocumentResult!);
    } else {
      listener.onErrorDocument(resultChannelDocumentOpenCamera.error!);
    }
  }

  @override
  void openCameraDocument(
      {required String jsonFileName,
      required DocumentType documentType,
      required UnicoDocument listener}) {
    _requestOpenDocument.setConfigUnicoFileName(jsonFileName);
    _requestOpenDocument.setDocumentType(documentType);
    _caseOpenDocument
        .openDocument(requestOpenDocument: _requestOpenDocument)
        .then((value) => responseReturn(listener, value));
  }
}
