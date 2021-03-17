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
  String androidColorSilhoutte = null;
  String androidColorBackground = null;
  String androidColorBoxMessage = null;
  String androidColorTextMessage = null;
  String androidColorBackgroundPopupError = null;
  String androidColorTextPopupError = null;
  String androidColorBackgroundButtonPopupError = null;
  String androidColorTextButtonPopupError = null;
  String androidColorBackgroundTakePictureButton = null;
  String androidColorIconTakePictureButton = null;
  String androidColorBackgroundBottomDocument = null;
  String androidColorTextBottomDocument = null;

  //IOS cuscum layout
  String iosColorSilhoutteNeutra = null;
  String iosColorSilhoutteSuccess = null;
  String iosColorSilhoutteError = null;
  String iosColorBackground = null;
  String iosColorBackgroundBoxStatus = null;
  String iosColorTextBoxStatus = null;
  String iosColorBackgroundPopupError = null;
  String iosColorTextPopupError = null;
  String iosImageIconPopupError = null;


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
  void setAndroidColorSilhoutte(String success_stroke_color,  String error_stroke_color){androidColorSilhoutte = success_stroke_color+";"+success_stroke_color;}
  void setAndroidColorBackground( String colorBlueMask){androidColorBackground = colorBlueMask;}
  void setAndroidColorBoxMessage( String colorWhite){ androidColorBoxMessage = colorWhite;}
  void setAndroidColorTextMessage( String colorBlack){androidColorTextMessage = colorBlack;}
  void setAndroidColorBackgroundPopupError( String colorAccent){ androidColorBackgroundPopupError = colorAccent;}
  void setAndroidColorTextPopupError( String colorGreen){androidColorTextPopupError = colorGreen;}
  void setAndroidColorBackgroundButtonPopupError( String red_btn_bg_color){androidColorBackgroundButtonPopupError = red_btn_bg_color;}
  void setAndroidColorTextButtonPopupError( String colorPrimary){androidColorTextButtonPopupError = colorPrimary;}
  void setAndroidColorBackgroundTakePictureButton( String colorGreyDark){androidColorBackgroundTakePictureButton = colorGreyDark;}
  void setAndroidColorIconTakePictureButton( String colorOrange){androidColorIconTakePictureButton = colorOrange;}
  void setAndroidColorBackgroundBottomDocument( String red_btn_bg_color){androidColorBackgroundBottomDocument = red_btn_bg_color;}
  void setAndroidColorTextBottomDocument( String colorGreen){androidColorTextBottomDocument = colorGreen;}
  //endregion

  //region IOS
  void setIosColorSilhoutteNeutra(String color ){iosColorSilhoutteNeutra = color;}
  void setIosColorSilhoutteSuccess(String color ){iosColorSilhoutteSuccess = color;}
  void setIosColorSilhoutteError(String color ){iosColorSilhoutteError = color;}
  void setIosColorBackground(String color ){iosColorBackground = color;}
  void setIosColorBackgroundBoxStatus(String color ){iosColorBackgroundBoxStatus = color;}
  void setIosColorTextBoxStatus(String color ){iosColorTextBoxStatus = color;}
  void setIosColorBackgroundPopupError(String color ){iosColorBackgroundPopupError = color;}
  void setIosColorTextPopupError(String color ){iosColorTextPopupError = color;}
  void setIosImageIconPopupError(String color ){iosImageIconPopupError = color;}
//endregion

//endregion



}
