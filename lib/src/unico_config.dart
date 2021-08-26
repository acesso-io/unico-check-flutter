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
  String? iosColorSilhoutteNeutra;
  String? iosColorSilhoutteSuccess;
  String? iosColorSilhoutteError;
  String? iosColorBackground;
  String? iosColorBackgroundBoxStatus;
  String? iosColorTextBoxStatus;
  String? iosColorBackgroundPopupError;
  String? iosColorTextPopupError;
  String? iosImageIconPopupError;

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
    this.iosColorSilhoutteNeutra,
    this.iosColorSilhoutteSuccess,
    this.iosColorSilhoutteError,
    this.iosColorBackground,
    this.iosColorBackgroundBoxStatus,
    this.iosColorTextBoxStatus,
    this.iosColorBackgroundPopupError,
    this.iosColorTextPopupError,
    this.iosImageIconPopupError,
    this.setTimeoutSession,
    this.setTimeoutToFaceInference,
  });

  Map<dynamic, dynamic> get getCommonMap {
    var map = <String, dynamic>{
      ///Android custom layout
      ///adiciona cor a silhueta de captura
      'androidColorBackground': androidColorBackground,

      ///adiciona cor no funudo da captura
      'androidColorBoxMessage': androidColorBoxMessage,

      ///adiciona cor no box de mensagem
      'androidColorTextMessage': androidColorTextMessage,

      ///adiciona cor no texto da mensagem
      'androidColorBackgroundPopupError': androidColorBackgroundPopupError,

      ///adiciona cor no fundo do popup de erro
      'androidColorTextPopupError': androidColorTextPopupError,

      ///adiciona cor no texto de erro do popup
      'androidColorBackgroundButtonPopupError':
          androidColorBackgroundButtonPopupError,

      ///adiciona cor no botão popup
      'androidColorTextButtonPopupError': androidColorTextButtonPopupError,

      ///adiciona cor no texto do botão do popup
      'androidColorBackgroundTakePictureButton':
          androidColorBackgroundTakePictureButton,

      ///adiciona cor no fundo de captura
      'androidColorIconTakePictureButton': androidColorIconTakePictureButton,

      ///adiciona cor no icone do botão de captura
      'androidColorBackgroundBottomDocument':
          androidColorBackgroundBottomDocument,

      ///adiciona cor no fundo do botão de captura
      'androidColorTextBottomDocument': androidColorTextBottomDocument,

      ///adiciona cor no texto do botão de captura documento
      'androidColorSilhouetteSuccess': androidColorSilhouetteSuccess,

      ///adiciona cor no texto do botão de captura documento
      'androidColorSilhouetteError': androidColorSilhouetteError,

      /// IOS custom layout
      /// adiciona cor na silhueta de captura
      'setIosColorSilhoutteNeutra': iosColorSilhoutteNeutra,

      ///adiciona cor na silhueta de sucesso
      'setIosColorSilhoutteSuccess': iosColorSilhoutteSuccess,

      ///adiciona cor na silhueta de erro
      'setIosColorSilhoutteError': iosColorSilhoutteError,

      ///adiciona cor no fundo de captura
      'setIosColorBackground': iosColorBackground,

      ///adiciona cor no fundo da caixa de status
      'setIosColorBackgroundBoxStatus': iosColorBackgroundBoxStatus,

      ///adiciona cor no texto da caixa de status
      'setIosColorTextBoxStatus': iosColorTextBoxStatus,

      ///adiciona cor no fundo do icone popup de erro
      'setIosColorBackgroundPopupError': iosColorBackgroundPopupError,

      ///adiciona cor no texto popup de erro
      'setIosColorTextPopupError': iosColorTextPopupError,

      ///adiciona cor no icone popup erro
      'setIosImageIconPopupError': iosImageIconPopupError,

      ///adiciona timer de sessão
      'setTimeoutSession': setTimeoutSession,

      ///adiciona timer de inferencia do rosto
      'setTimeoutToFaceInference': setTimeoutToFaceInference
    };

    return map;
  }
}
