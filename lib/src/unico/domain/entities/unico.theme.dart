class UnicoTheme {
  String? colorBackground = "";
  String? colorBoxMessage = "";
  String? colorTextMessage = "";
  String? colorBackgroundPopupError = "";
  String? colorTextPopupError = "";
  String? colorBackgroundButtonPopupError = "";
  String? colorTextButtonPopupError = "";
  String? colorBackgroundTakePictureButton = "";
  String? colorIconTakePictureButton = "";
  String? colorBackgroundBottomDocument = "";
  String? colorTextBottomDocument = "";
  String? colorSilhouetteSuccess = "";
  String? colorSilhouetteError = "";
  String? colorSilhouetteNeutral = "";

  ///Objeto de tema da unico
  UnicoTheme({
    this.colorBackground,
    this.colorBoxMessage,
    this.colorTextMessage,
    this.colorBackgroundPopupError,
    this.colorTextPopupError,
    this.colorBackgroundButtonPopupError,
    this.colorTextButtonPopupError,
    this.colorBackgroundTakePictureButton,
    this.colorIconTakePictureButton,
    this.colorBackgroundBottomDocument,
    this.colorTextBottomDocument,
    this.colorSilhouetteSuccess,
    this.colorSilhouetteError,
    this.colorSilhouetteNeutral,
  });

  Map<dynamic, dynamic> get getCommonMap {
    var map = <String, dynamic>{
      /// Cor de sucesso da silhueta.
      'colorBackground': colorBackground,

      /// Cor de fundo da mensagem.
      'colorBoxMessage': colorBoxMessage,

      /// Cor de texto da mensagem.
      'colorTextMessage': colorTextMessage,

      /// Cor de fundo do popup.
      'colorBackgroundPopupError': colorBackgroundPopupError,

      /// Cor de texto e ícones do popup.
      'colorTextPopupError': colorTextPopupError,

      /// Cor de fundo do botão do popup.
      'colorBackgroundButtonPopupError': colorBackgroundButtonPopupError,

      /// Cor de texto do botão do popup.
      'colorTextButtonPopupError': colorTextButtonPopupError,

      /// Cor de fundo do botão de tirar foto manualmente.
      'colorBackgroundTakePictureButton': colorBackgroundTakePictureButton,

      /// Cor de ícone do botão de tirar foto manualmente.
      'colorIconTakePictureButton': colorIconTakePictureButton,

      /// Adiciona cor no icone do botão de captura
      'colorBackgroundBottomDocument': colorBackgroundBottomDocument,

      /// Cor de fundo do box na captura de documentos.
      'colorTextBottomDocument': colorTextBottomDocument,

      /// Cor de sucesso da silhueta.
      'colorSilhouetteSuccess': colorSilhouetteSuccess,

      /// Cor de erro da silhueta.
      'colorSilhouetteNeutral': colorSilhouetteNeutral
    };

    return map;
  }
}
