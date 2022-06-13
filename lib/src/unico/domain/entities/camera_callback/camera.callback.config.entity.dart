import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

class CameraCallbackConfingEntity {
  final UnicoErrorChannel? unicoError;
  final UnicoListener unicoListener;
  final UnicoSelfie? listenerSelfie;
  final UnicoDocument? listenerDocument;

  CameraCallbackConfingEntity({
    this.unicoError,
    required this.unicoListener,
    this.listenerSelfie,
    this.listenerDocument,
  });
}
