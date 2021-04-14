class UnicoConfig {
  /// Url para sua identificação da sua empresa
  final String _urlInstance;

  /// Key unica da sua empresa
  final String _apikey;

  /// Token para garantir sua autenticidade
  /// Veja a documentação para gerar esse token:
  /// https://acesso-io.github.io/docs/platform/identity/protocols/oauth2/get-token.html
  final String _authToken;

  //Android custom layout
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

  //IOS custom layout
  String? iosColorSilhoutteNeutra;
  String? iosColorSilhoutteSuccess;
  String? iosColorSilhoutteError;
  String? iosColorBackground;
  String? iosColorBackgroundBoxStatus;
  String? iosColorTextBoxStatus;
  String? iosColorBackgroundPopupError;
  String? iosColorTextPopupError;
  String? iosImageIconPopupError;

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
  })  : _urlInstance = urlInstance,
        _apikey = apikey,
        _authToken = authToken;

  Map<dynamic, dynamic> get getCommonMap {
    var map = <String, dynamic>{
      'urlIntance': _urlInstance,
      'apikey': _apikey,
      'authToken': _authToken,

      //Android custom layout
      'setAndroidColorSilhoutte': androidColorSilhoutte,
      'setAndroidColorBackground': androidColorBackground,
      'setAndroidColorBoxMessage': androidColorBoxMessage,
      'setAndroidColorTextMessage': androidColorTextMessage,
      'setAndroidColorBackgroundPopupError': androidColorBackgroundPopupError,
      'setAndroidColorTextPopupError': androidColorTextPopupError,
      'setAndroidColorBackgroundButtonPopupError':
          androidColorBackgroundButtonPopupError,
      'setAndroidColorTextButtonPopupError': androidColorTextButtonPopupError,
      'setAndroidColorBackgroundTakePictureButton':
          androidColorBackgroundTakePictureButton,
      'setAndroidColorIconTakePictureButton': androidColorIconTakePictureButton,
      'setAndroidColorBackgroundBottomDocument':
          androidColorBackgroundBottomDocument,
      'setAndroidColorTextBottomDocument': androidColorTextBottomDocument,

      //IOS custom layout
      'setIosColorSilhoutteNeutra': iosColorSilhoutteNeutra,
      'setIosColorSilhoutteSuccess': iosColorSilhoutteSuccess,
      'setIosColorSilhoutteError': iosColorSilhoutteError,
      'setIosColorBackground': iosColorBackground,
      'setIosColorBackgroundBoxStatus': iosColorBackgroundBoxStatus,
      'setIosColorTextBoxStatus': iosColorTextBoxStatus,
      'setIosColorBackgroundPopupError': iosColorBackgroundPopupError,
      'setIosColorTextPopupError': iosColorTextPopupError,
      'setIosImageIconPopupError': iosImageIconPopupError
    };

    return map;
  }
}
