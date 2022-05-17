import 'package:unico_check/src/clean/domain/entities/request.open.document.dart';
import 'package:unico_check/src/clean/domain/entities/result.channel.document.open.camera.dart';
import 'package:unico_check/src/clean/domain/entities/result.channel.selfie.open.camera.dart';

abstract class UseCaseOpenDocument {
  Future<ResultChannelDocumentOpenCamera> openDocument(
      {required RequestOpenDocument requestOpenDocument});
}
