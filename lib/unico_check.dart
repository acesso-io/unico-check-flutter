import 'package:flutter/services.dart';
import 'abstracts/IAcessoBio.dart';
import 'abstracts/IAcessoBioAuthenticate.dart';
import 'abstracts/IAcessoBioCamera.dart';
import 'abstracts/IAcessoBioDocument.dart';
import 'abstracts/IAcessoBioLiveness.dart';
import 'result/success/ResultCamera.dart';
import 'result/success/ResultAuthenticate.dart';
import 'result/success/OCRResponse.dart';
import 'result/success/ResultCameraDocument.dart';
import 'result/success/ResultFacematch.dart';
import 'result/success/ResultLivenessX.dart';
import 'result/error/ErrorBio.dart';

class UnicoCheck {

  static const MethodChannel _channel = const MethodChannel('acessobio');

  String _urlIntance = null;
  String _apikey = null;
  String _authToken = null;

  static final int RG_FRENTE = 501;
  static final int RG_VERSO = 502;
  static final int CNH = 4;

  IAcessoBio iAcessoBio;
  IAcessoBioCamera iAcessoBioCamera;
  IAcessoBioDocument iAcessoBioDocument;
  IAcessoBioLiveness iAcessoBioLiveness;
  IAcessoBioAuthenticate iAcessoBioAuthenticate;

  //Android custom layout
  String androidColorSilhoutte;
  String androidColorBackground;
  String androidColorBoxMessage;
  String androidColorTextMessage;
  String androidColorBackgroundPopupError;
  String androidColorTextPopupError;
  String androidColorBackgroundButtonPopupError;
  String androidColorTextButtonPopupError;
  String androidColorBackgroundTakePictureButton;
  String androidColorIconTakePictureButton;
  String androidColorBackgroundBottomDocument;
  String androidColorTextBottomDocument;

  //IOS cuscum layout
  String iosColorSilhoutteNeutra;
  String iosColorSilhoutteSuccess;
  String iosColorSilhoutteError;
  String iosColorBackground;
  String iosColorBackgroundBoxStatus;
  String iosColorTextBoxStatus;
  String iosColorBackgroundPopupError;
  String iosColorTextPopupError;
  String iosImageIconPopupError;


  ///Para iniciar nossa tecnologia forneça o contexto da aplicação e as chaves de acesso disponibilizadas pela unico
  UnicoCheck(IAcessoBio context, String urlIntance, String apikey, String authToken){

    if(context is IAcessoBio){
      this.iAcessoBio = context;
    }else{
      throw new Exception("A classe iAcessoBio não foi implementada. É necessário realizar a implementação para prosseguir.");
    }

    if(context is IAcessoBioCamera){
      this.iAcessoBioCamera = context as IAcessoBioCamera;
    }
    if(context is IAcessoBioDocument){
      this.iAcessoBioDocument = context as IAcessoBioDocument;
    }
    if(context is IAcessoBioLiveness){
      this.iAcessoBioLiveness = context as IAcessoBioLiveness;
    }
    if(context is IAcessoBioAuthenticate){
      this.iAcessoBioAuthenticate = context as IAcessoBioAuthenticate;
    }

    _urlIntance = urlIntance;
    _apikey = apikey;
    _authToken = authToken;

  }

  bool validResult(Map<dynamic, dynamic> result){

    var flutterResult = result["flutterstatus"];

    if(flutterResult == 2){
      iAcessoBio.onErrorAcessoBio(ErrorBio(result));
      return false;
    }else if(flutterResult == -1){
      iAcessoBio.userClosedCameraManually();
      return false;
    }else {
      return true;
    }

  }

  Map<dynamic, dynamic> buildMap(){

    var map = <dynamic, dynamic>{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,

      //Android custom layout
      "setAndroidColorSilhoutte": androidColorSilhoutte,
      "setAndroidColorBackground": androidColorBackground,
      "setAndroidColorBoxMessage": androidColorBoxMessage,
      "setAndroidColorTextMessage": androidColorTextMessage,
      "setAndroidColorBackgroundPopupError": androidColorBackgroundPopupError,
      "setAndroidColorTextPopupError": androidColorTextPopupError,
      "setAndroidColorBackgroundButtonPopupError": androidColorBackgroundButtonPopupError,
      "setAndroidColorTextButtonPopupError": androidColorTextButtonPopupError,
      "setAndroidColorBackgroundTakePictureButton": androidColorBackgroundTakePictureButton,
      "setAndroidColorIconTakePictureButton": androidColorIconTakePictureButton,
      "setAndroidColorBackgroundBottomDocument": androidColorBackgroundBottomDocument,
      "setAndroidColorTextBottomDocument": androidColorTextBottomDocument,

      //Ios custom layout
      "setIosColorSilhoutteNeutra": iosColorSilhoutteNeutra,
      "setIosColorSilhoutteSuccess": iosColorSilhoutteSuccess,
      "setIosColorSilhoutteError": iosColorSilhoutteError,
      "setIosColorBackground": iosColorBackground,
      "setIosColorBackgroundBoxStatus": iosColorBackgroundBoxStatus,
      "setIosColorTextBoxStatus": iosColorTextBoxStatus,
      "setIosColorBackgroundPopupError": iosColorBackgroundPopupError,
      "setIosColorTextPopupError": iosColorTextPopupError,
      "setIosImageIconPopupError": iosImageIconPopupError

    };

    return map;

  }

  //region LIVENESS
  ///Inicia processo de liveness
  get openLiveness async {

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openLiveness',buildMap());

    if(validResult(result)) {

      if(result["flutterstatus"] == 1) {
        iAcessoBioLiveness.onSuccessLiveness(ResultLivenessX(result));
      }else{
        iAcessoBioLiveness.onErrorLiveness(ErrorBio(result));
      }

    }


  }
  ///Inicia liviness e cria um processo
  void openLivenessWithCreateProcess(String name, String document) async {

    var map = buildMap();

    map["name"] = name;
    map["document"] = document;


    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openLivenessWithCreateProcess',map);

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioLiveness.onSuccessLiveness(ResultLivenessX(result));
      }else{
        iAcessoBioLiveness.onErrorLiveness(ErrorBio(result));
      }

    }


  }
  //endregion

  //region DOCUMENT
  ///Inicia abertura de camera OCR
  void openCameraDocumentOCR(int DOCUMENT_TYPE) async {

    var map = buildMap();

    map["DOCUMENT_TYPE"] = DOCUMENT_TYPE;

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraDocumentOCR',map);

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioDocument.onSuccessOCR(OCRResponse(result));
      }else{
        iAcessoBioDocument.onErrorOCR(result["result"]);
      }

    }

  }
  ///Inicia faceMatch
  void openFaceMatch(int DOCUMENT_TYPE) async {

    var map = buildMap();

    map["DOCUMENT_TYPE"] = DOCUMENT_TYPE;

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openFaceMatch',map);

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioDocument.onSuccessFaceMatch(ResultFacematch(result));
      }else{
        iAcessoBioDocument.onErrorFaceMatch(result["result"]);
      }

    }

  }
  ///Inicia abertura de camera OCR
  void openCameraDocument(int DOCUMENT_TYPE) async {

    var map = buildMap();

    map["DOCUMENT_TYPE"] = DOCUMENT_TYPE;

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraDocument',map);

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioDocument.onSuccesstDocument(ResultCameraDocument(result));
      }else{
        iAcessoBioDocument.onErrorFaceMatch(result["result"]);
      }

    }

  }

  //endregion

  //region AUTH
  ///Inicia liveness para authenticação
  void openLivenessAuthenticate(String code) async {

    var map = buildMap();

    map["code"] = code;

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openLivenessAuthenticate',map);

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioAuthenticate.onSuccessAuthenticate(ResultAuthenticate(result));
      }else{
        iAcessoBioAuthenticate.onErrorAuthenticate(ErrorBio(result));
      }

    }

  }

  //endregion

  //region CAMERA
  ///Inicia camera inteligente
  get openCamera async {

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCamera',buildMap());

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioCamera.onSuccessCamera(ResultCamera(result));
      }else{
        iAcessoBioCamera.onErrorCamera(ErrorBio(result));
      }

    }


  }
  ///Inicia camera inteligenre e cria um processo
  void openCameraWithCreateProcess(String nome, String code, String gender, String birthdate, String email, String phone ) async {

    var map = buildMap();
    map["nome"] = nome;
    map["code"] = code;
    map["gender"] = gender;
    map["birthdate"] = birthdate;
    map["email"] = email;
    map["phone"] = phone;

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraWithCreateProcess',map);

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioCamera.onSuccessCamera(ResultCamera(result));
      }else{
        iAcessoBioCamera.onErrorCamera(ErrorBio(result));
      }

    }

  }
  ///Inicia camera inteligente, cria um processo e incere um documento (disponivel apenas para android no momento)
  void openCameraWithCreateProcessAndInsertDocument(String code, String nome, int DOCUMENT_TYPE) async {

    var map = buildMap();
    map["code"] = code;
    map["nome"] = nome;
    map["DOCUMENT_TYPE"] = DOCUMENT_TYPE;

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraInsertDocument',map);

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioCamera.onSucessDocumentInsert(result["processId"],result["typed"]);
      }else{
        iAcessoBioCamera.onErrorDocumentInsert(result["result"]);
      }

    }

  }

  //endregion

  //region COSTOMIZATION

  //region Android
  ///Permite fazer cosumização da silhueta em que o usuario encaixa o rosto  no ANDROID
  void setAndroidColorSilhoutte(String success_stroke_color,  String error_stroke_color){androidColorSilhoutte = success_stroke_color+";"+success_stroke_color;}
  ///Permite mudar a cor do fundo da tela de captura no ANDROID
  void setAndroidColorBackground( String colorBlueMask){androidColorBackground = colorBlueMask;}
  ///Permite a costumização cor do caixa de mensagem no ANDROID
  void setAndroidColorBoxMessage( String colorWhite){ androidColorBoxMessage = colorWhite;}
  ///Permite adicionar cor no texto da mensagem no ANDROID
  void setAndroidColorTextMessage( String colorBlack){androidColorTextMessage = colorBlack;}
  ///Permite costumizar o fundo o popup de erro no ANDROID
  void setAndroidColorBackgroundPopupError( String colorAccent){ androidColorBackgroundPopupError = colorAccent;}
  ///Permite personalizar o texto da caixa de erro no ANDROID
  void setAndroidColorTextPopupError( String colorGreen){androidColorTextPopupError = colorGreen;}
  ///Permite costumizar o botao do popup de erro no ANDROID
  void setAndroidColorBackgroundButtonPopupError( String red_btn_bg_color){androidColorBackgroundButtonPopupError = red_btn_bg_color;}
  ///Permite costumizar a cor do texto do botao do popup error no ANDROID
  void setAndroidColorTextButtonPopupError( String colorPrimary){androidColorTextButtonPopupError = colorPrimary;}
  ///Permite costumizar fundo do botao que captura a foto no ANDROID
  void setAndroidColorBackgroundTakePictureButton( String colorGreyDark){androidColorBackgroundTakePictureButton = colorGreyDark;}
  ///Permite costumizaar a cor do icone que captura a foto no ANDROID
  void setAndroidColorIconTakePictureButton( String colorOrange){androidColorIconTakePictureButton = colorOrange;}
  ///Permite costumizar a cor do botao captura foto do documento no ANDROID
  void setAndroidColorBackgroundBottomDocument( String red_btn_bg_color){androidColorBackgroundBottomDocument = red_btn_bg_color;}
  ///Permite alterar a cor do botao captura foto do documento no ANDROID
  void setAndroidColorTextBottomDocument( String colorGreen){androidColorTextBottomDocument = colorGreen;}
  //endregion

  //region IOS
  ///Permite alterar a cor da silhueta em que o usuario encaixa o tosto  no IOS
  void setIosColorSilhoutteNeutra(String color ){iosColorSilhoutteNeutra = color;}
  ///Permite alterar a cor da silhueta em que o usuario encaixa o rosto quando esta em estado de sucesso no IOS
  void setIosColorSilhoutteSuccess(String color ){iosColorSilhoutteSuccess = color;}
  ///Permite alterar ao a cor da silhueta em que o usuario encaixa o rosto quando esta em estado descentralizado no IOS
  void setIosColorSilhoutteError(String color ){iosColorSilhoutteError = color;}
  /// permite alterar a cor de fundo da captura de imagem no IOS
  void setIosColorBackground(String color ){iosColorBackground = color;}
  ///Permite alterar a cor da caixa de status no IOS
  void setIosColorBackgroundBoxStatus(String color ){iosColorBackgroundBoxStatus = color;}
  ///Permite alterar o texti da caixa de status no IOS
  void setIosColorTextBoxStatus(String color ){iosColorTextBoxStatus = color;}
  ///Permite alterar a cor do fundo da caixa de popup de erro no IOS
  void setIosColorBackgroundPopupError(String color ){iosColorBackgroundPopupError = color;}
  ///Permite altera a cor do texto da caixa de popup de erro no IOS
  void setIosColorTextPopupError(String color ){iosColorTextPopupError = color;}
  ///Permite alterar a cor do icone de popup error no IOS
  void setIosImageIconPopupError(String color ){iosImageIconPopupError = color;}
//endregion

//endregion



}
