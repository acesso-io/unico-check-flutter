class UnicoConfig {

  /// Url para sua identificação da sua empresa
  final String _urlInstance;

  /// Key unica da sua empresa
  final String _apikey;

  /// Token para garantir sua autenticidade
  /// Veja a documentação para gerar esse token:
  /// https://acesso-io.github.io/docs/platform/identity/protocols/oauth2/get-token.html
  final String _authToken;

  ///Android custom layout
  String? androidColorSilhoutte;
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

  ///Objeto de configuracao unico
  UnicoConfig({
    required String urlInstance,
    required String apikey,
    required String authToken,
    this.androidColorSilhoutte,
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
    this.iosColorSilhoutteNeutra,
    this.iosColorSilhoutteSuccess,
    this.iosColorSilhoutteError,
    this.iosColorBackground,
    this.iosColorBackgroundBoxStatus,
    this.iosColorTextBoxStatus,
    this.iosColorBackgroundPopupError,
    this.iosColorTextPopupError,
    this.iosImageIconPopupError,
  })  : _urlInstance = urlInstance, ///url
        _apikey = apikey, ///apikey
        _authToken = authToken; ///token

  Map<dynamic, dynamic> get getCommonMap {
    var map = <String, dynamic>{
      'urlIntance': _urlInstance,
      'apikey': _apikey,
      'authToken': _authToken,

      ///Android custom layout
      ///adiciona cor a silhueta de captura
      'setAndroidColorSilhoutte': androidColorSilhoutte,
      ///adiciona cor no funudo da captura
      'setAndroidColorBackground': androidColorBackground,
      ///adiciona cor no box de mensagem
      'setAndroidColorBoxMessage': androidColorBoxMessage,
      ///adiciona cor no texto da mensagem
      'setAndroidColorTextMessage': androidColorTextMessage,
      ///adiciona cor no fundo do popup de erro
      'setAndroidColorBackgroundPopupError': androidColorBackgroundPopupError,
      ///adiciona cor no texto de erro do popup
      'setAndroidColorTextPopupError': androidColorTextPopupError,
      ///adiciona cor no botão popup
      'setAndroidColorBackgroundButtonPopupError': androidColorBackgroundButtonPopupError,
      ///adiciona cor no texto do botão do popup
      'setAndroidColorTextButtonPopupError': androidColorTextButtonPopupError,
      ///adiciona cor no fundo de captura
      'setAndroidColorBackgroundTakePictureButton': androidColorBackgroundTakePictureButton,
      ///adiciona cor no icone do botão de captura
      'setAndroidColorIconTakePictureButton': androidColorIconTakePictureButton,
      ///adiciona cor no fundo do botão de captura
      'setAndroidColorBackgroundBottomDocument': androidColorBackgroundBottomDocument,
      ///adiciona cor no texto do botão de captura documento
      'setAndroidColorTextBottomDocument': androidColorTextBottomDocument,

      ///IOS custom layout
      ///adiciona cor na silhueta de captura
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
      'setIosImageIconPopupError': iosImageIconPopupError
    };

    return map;
  }
}
