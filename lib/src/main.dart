import 'package:flutter/services.dart';
import 'package:unico_check/src/functions/document.functions.dart';
import 'package:unico_check/src/unico_config.dart';
import 'core/abstracts/acesso_bio_camera.interface.dart';
import 'core/abstracts/acesso_bio_document.interface.dart';
import 'functions/camera.functions.dart';

class UnicoCheck {
  static const _channel = MethodChannel('acessobio');

  /// Sua config inicial da unico
  /// Instancie a classe ```UnicoConfig``` e passe ela como parametro
  final UnicoConfig _config;

  // Classe onde ficam as funções para as funções do liveness
  // late LivenessFunctions? liveness;

  /// Classe onde ficam as funções para as funções do documento
  late DocumentFunctions? document;

  /// Classe onde ficam as funções para as funções da camera
  late CameraFunctions? camera;

  /// ```Context``` é a classe que você irá implementar a interface que você gostaria
  /// de utilizar
  UnicoCheck({required Object context, required UnicoConfig config})
      : _config = config {

    ///IAcessoBioDocument implementa as funcionalidades de documento
    if (context is IAcessoBioDocument) {
      document = DocumentFunctions(
        channel: _channel,
        config: _config,
        callbacks: context,
      );
    }

    ///IAcessoBioAuthenticate implementa as funcionalidade camera inteligente
    if (context is IAcessoBioCamera) {
      camera = CameraFunctions(
        channel: _channel,
        config: _config,
        callbacks: context,
      );
    }
  }
}
