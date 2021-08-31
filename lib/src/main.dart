import 'package:flutter/services.dart';
import 'package:unico_check/src/core/abstracts/acesso_bio_selfie.interface.dart';
import 'package:unico_check/src/functions/document.functions.dart';
import 'package:unico_check/src/unico_config.dart';

import 'core/abstracts/acesso_bio_document.interface.dart';
import 'functions/camera.functions.dart';

class UnicoCheck {
  static const _channel = MethodChannel('acessobio');

  /// Sua config inicial da unico
  /// Instancie a classe ```UnicoConfig``` e passe ela como parametro
  /// Nesta classe é configurado as customizações da camera
  /// como timeout e cores
  final UnicoConfig _config;

  /// Classe onde ficam as funções para as funções do documento
  late DocumentFunctions? document;

  /// Classe onde ficam as funções para as funções da camera
  late CameraFunctions? camera;

  /// ```Context``` é a classe que você irá implementar a interface que você gostaria
  /// de utilizar
  UnicoCheck({required Object context, required UnicoConfig config})
      : _config = config {
    if (context is IAcessoBioDocument || context is IAcessoBioSelfie) {
      ///IAcessoBioDocument implementa as funcionalidades de documento
      ///Para receber os resultados da captura do documento
      ///implemente a interface IAcessoBioDocument
      if (context is IAcessoBioDocument) {
        document = DocumentFunctions(
          channel: _channel,
          config: _config,
          callbacks: context,
        );
      }

      ///IAcessoBioAuthenticate implementa as funcionalidade camera inteligente
      ///Para receber os resultados da captura da camera normal e camera inteligente
      ///implemente a interface IAcessoBioCamera
      if (context is IAcessoBioSelfie) {
        camera = CameraFunctions(
          channel: _channel,
          config: _config,
          callbacks: context,
        );
      }
    } else {
      throw new Exception(
          'Implementa a interface para receber o resultado: ( IAcessoBioDocument e/ou IAcessoBioCamera ) ');
    }
  }
}
