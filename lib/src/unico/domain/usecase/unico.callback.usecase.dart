import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

abstract class UnicoCallBackUseCase {
  void execute({required UnicoErrorChannel? unicoError,
    required UnicoListener unicoListener,
    required UnicoSelfie? listenerSelfie,
    required UnicoDocument? listenerDocument});
}