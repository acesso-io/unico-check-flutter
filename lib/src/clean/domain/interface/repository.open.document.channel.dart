import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'package:unico_check/src/clean/domain/entities/request.open.document.dart';
import 'package:unico_check/src/clean/domain/entities/result.channel.document.open.camera.dart';

abstract class RepositoryOpenDocumentChannel {
  Future<ResultChannelDocumentOpenCamera> callOpenDocument(
      {required String method,
      required DocumentType documentType,
      required RequestOpenDocument requestOpenDocument});
}
