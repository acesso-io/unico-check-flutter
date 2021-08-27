class UnicoConfig {
  ///Android custom layout
  String? androidColorBackground;
  String? androidColorBoxMessage;
  String? androidColorTextMessage;
  String? androidColorBackgroundPopupError;
  String? androidColorTextPopupError;
  String? androidColorBackgroundButtonPopupError;
  String? androidColorTextButtonPopupError;
  String? androidColorBackgroundTakePictureButton;
  String? androidColorIconTakePictureButton;
  String? androidColorBackgroundBottomDocument;
  String? androidColorTextBottomDocument;
  String? androidColorSilhouetteSuccess;
  String? androidColorSilhouetteError;

  ///IOS custom layout
  String? iosColorBackground;
  String? iosColorBoxMessage;
  String? iosColorTextMessage;
  String? iosColorBackgroundPopupError;
  String? iosColorTextPopupError;
  String? iosColorBackgroundButtonPopupError;
  String? iosColorTextButtonPopupError;
  String? iosColorBackgroundTakePictureButton;
  String? iosColorIconTakePictureButton;
  String? iosColorBackgroundBottomDocument;
  String? iosColorTextBottomDocument;
  String? iosColorSilhouetteSuccess;
  String? iosColorSilhouetteError;

  ///Timers
  double? setTimeoutSession;
  double? setTimeoutToFaceInference;

  ///Objeto de configuracao unico
  UnicoConfig({
    this.androidColorBackground,
    this.androidColorBoxMessage,
    this.androidColorTextMessage,
    this.androidColorBackgroundPopupError,
    this.androidColorTextPopupError,
    this.androidColorBackgroundButtonPopupError,
    this.androidColorTextButtonPopupError,
    this.androidColorBackgroundTakePictureButton,
    this.androidColorIconTakePictureButton,
    this.androidColorBackgroundBottomDocument,
    this.androidColorTextBottomDocument,
    this.androidColorSilhouetteSuccess,
    this.androidColorSilhouetteError,
    this.iosColorBackground,
    this.iosColorBoxMessage,
    this.iosColorTextMessage,
    this.iosColorBackgroundPopupError,
    this.iosColorTextPopupError,
    this.iosColorBackgroundButtonPopupError,
    this.iosColorTextButtonPopupError,
    this.iosColorBackgroundTakePictureButton,
    this.iosColorIconTakePictureButton,
    this.iosColorBackgroundBottomDocument,
    this.iosColorTextBottomDocument,
    this.iosColorSilhouetteSuccess,
    this.iosColorSilhouetteError,
    this.setTimeoutSession,
    this.setTimeoutToFaceInference,
  });

  Map<dynamic, dynamic> get getCommonMap {
    var map = <String, dynamic>{
      ///Android custom layout
      /// Cor de sucesso da silhueta.
      'androidColorBackground': androidColorBackground,

      /// Cor de fundo da mensagem.
      'androidColorBoxMessage': androidColorBoxMessage,

      /// Cor de texto da mensagem.
      'androidColorTextMessage': androidColorTextMessage,

      /// Cor de fundo do popup.
      'androidColorBackgroundPopupError': androidColorBackgroundPopupError,

      /// Cor de texto e ícones do popup.
      'androidColorTextPopupError': androidColorTextPopupError,

      /// Cor de fundo do botão do popup.
      'androidColorBackgroundButtonPopupError':
          androidColorBackgroundButtonPopupError,

      /// Cor de texto do botão do popup.
      'androidColorTextButtonPopupError': androidColorTextButtonPopupError,

      /// Cor de fundo do botão de tirar foto manualmente.
      'androidColorBackgroundTakePictureButton':
          androidColorBackgroundTakePictureButton,

      /// Cor de ícone do botão de tirar foto manualmente.
      'androidColorIconTakePictureButton': androidColorIconTakePictureButton,

      ///adiciona cor no icone do botão de captura
      'androidColorBackgroundBottomDocument':
          androidColorBackgroundBottomDocument,

      ///Cor de fundo do box na captura de documentos.
      'androidColorTextBottomDocument': androidColorTextBottomDocument,

      /// Cor de sucesso da silhueta.
      'androidColorSilhouetteSuccess': androidColorSilhouetteSuccess,

      /// Cor de erro da silhueta.
      'androidColorSilhouetteError': androidColorSilhouetteError,

      /// IOS custom layout
      /// Cor de fundo da silhueta.
      'iosColorBackground': iosColorBackground,

      /// Cor de fundo da mensagem
      'iosColorBoxMessage': iosColorBoxMessage,

      /// Cor de texto da mensagem
      'iosColorTextMessage': iosColorTextMessage,

      /// Cor de fundo do popup
      'iosColorBackgroundPopupError': iosColorBackgroundPopupError,

      /// Cor de texto e ícones do popup.
      'iosColorTextPopupError': iosColorTextPopupError,

      /// Cor de fundo do botão do popup.
      'iosColorBackgroundButtonPopupError': iosColorBackgroundButtonPopupError,

      /// Cor de fundo do botão do popup.
      'iosColorTextButtonPopupError': iosColorTextButtonPopupError,

      /// Cor de fundo do botão de tirar foto manualmente.
      'iosColorBackgroundTakePictureButton':
          iosColorBackgroundTakePictureButton,

      /// Cor de ícone do botão de tirar foto manualmente.
      'iosColorIconTakePictureButton': iosColorIconTakePictureButton,

      /// Cor de fundo do box na captura de documentos.
      'iosColorBackgroundBottomDocument': iosColorBackgroundBottomDocument,

      /// Cor de texto do box na captura de documentos.
      'iosColorTextBottomDocument': iosColorTextBottomDocument,

      /// Cor de sucesso da silhueta.
      'iosColorSilhouetteSuccess': iosColorSilhouetteSuccess,

      /// Cor de erro da silhueta.
      'iosColorSilhouetteError': iosColorSilhouetteError,

      ///Config Timmers
      ///adiciona timer de sessão
      'setTimeoutSession': setTimeoutSession,

      ///adiciona timer de inferencia do rosto
      'setTimeoutToFaceInference': setTimeoutToFaceInference
    };

    return map;
  }
}
