import 'package:flutter/services.dart';
import 'abstracts/acesso_bio.interface.dart';
import 'abstracts/acesso_bio_authenticate.interface.dart';
import 'abstracts/acesso_bio_camera.interface.dart';
import 'abstracts/acesso_bio_document.interface.dart';
import 'abstracts/acesso_bio_liveness.interface.dart';
import 'result/success/camera.response.dart';
import 'result/success/authenticate.response.dart';
import 'result/success/ocr.response.dart';
import 'result/success/camera_document.response.dart';
import 'result/success/facematch.response.dart';
import 'result/success/liveness_x.response.dart';
import 'result/error/error_bio.response.dart';

class UnicoCheck {
  static const MethodChannel _channel = const MethodChannel('acessobio');

  String? _urlIntance;
  String? _apikey;
  String? _authToken;

  static const int rg_frente = 501;
  static const int rg_verso = 502;
  static const int cnh = 4;

  IAcessoBio? iAcessoBio;
  IAcessoBioCamera? iAcessoBioCamera;
  IAcessoBioDocument? iAcessoBioDocument;
  IAcessoBioLiveness? iAcessoBioLiveness;
  IAcessoBioAuthenticate? iAcessoBioAuthenticate;

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

  //IOS cuscum layout
  String? iosColorSilhoutteNeutra;
  String? iosColorSilhoutteSuccess;
  String? iosColorSilhoutteError;
  String? iosColorBackground;
  String? iosColorBackgroundBoxStatus;
  String? iosColorTextBoxStatus;
  String? iosColorBackgroundPopupError;
  String? iosColorTextPopupError;
  String? iosImageIconPopupError;

  UnicoCheck(
    IAcessoBio context,
    String urlIntance,
    String apikey,
    String authToken,
  ) {
    if (context is IAcessoBio) {
      this.iAcessoBio = context;
    } else {
      throw new Exception(
        'A classe iAcessoBio não foi implementada. É necessário realizar a implementação para prosseguir.',
      );
    }

    if (context is IAcessoBioCamera) {
      this.iAcessoBioCamera = context as IAcessoBioCamera;
    }
    if (context is IAcessoBioDocument) {
      this.iAcessoBioDocument = context as IAcessoBioDocument;
    }
    if (context is IAcessoBioLiveness) {
      this.iAcessoBioLiveness = context as IAcessoBioLiveness;
    }
    if (context is IAcessoBioAuthenticate) {
      this.iAcessoBioAuthenticate = context as IAcessoBioAuthenticate;
    }

    _urlIntance = urlIntance;
    _apikey = apikey;
    _authToken = authToken;
  }

  bool validResult(Map<dynamic, dynamic> result) {
    var flutterResult = result['flutterstatus'];

    if (flutterResult == 2) {
      final error = ErrorBioResponse(result);
      iAcessoBio?.onErrorAcessoBio(error);
      return false;
    } else if (flutterResult == -1) {
      iAcessoBio?.userClosedCameraManually();
      return false;
    } else {
      return true;
    }
  }

  Map<dynamic, dynamic> buildMap() {
    var map = <dynamic, dynamic>{
      'urlIntance': _urlIntance,
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

      //Ios custom layout
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

  //region LIVENESS
  get openLiveness async {
    final result = await _channel.invokeMethod('openLiveness', buildMap())
        as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = LivenessXResponse.fromJson(result);
        iAcessoBioLiveness?.onSuccessLiveness(response);
      } else {
        final error = ErrorBioResponse(result);
        iAcessoBioLiveness?.onErrorLiveness(error);
      }
    }
  }

  void openLivenessWithCreateProcess(String name, String document) async {
    var map = buildMap();

    map['name'] = name;
    map['document'] = document;

    final result = await _channel.invokeMethod(
      'openLivenessWithCreateProcess',
      map,
    ) as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = LivenessXResponse.fromJson(result);
        iAcessoBioLiveness?.onSuccessLiveness(response);
      } else {
        final error = ErrorBioResponse(result);
        iAcessoBioLiveness?.onErrorLiveness(error);
      }
    }
  }
  //endregion

  //region DOCUMENT

  void openCameraDocumentOCR(int documentType) async {
    var map = buildMap();

    map['DOCUMENT_TYPE'] = documentType;

    final result = await _channel.invokeMethod('openCameraDocumentOCR', map)
        as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = OCRResponse.fromJson(result);
        iAcessoBioDocument?.onSuccessOCR(response);
      } else {
        iAcessoBioDocument?.onErrorOCR(result['result']);
      }
    }
  }

  void openFaceMatch(int documentType) async {
    var map = buildMap();

    map['DOCUMENT_TYPE'] = documentType;

    final result = await _channel.invokeMethod('openFaceMatch', map)
        as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = FacematchResponse.fromJson(result);
        iAcessoBioDocument?.onSuccessFaceMatch(response);
      } else {
        iAcessoBioDocument?.onErrorFaceMatch(result['result']);
      }
    }
  }

  void openCameraDocument(int documentType) async {
    var map = buildMap();

    map['DOCUMENT_TYPE'] = documentType;

    final result = await _channel.invokeMethod('openCameraDocument', map)
        as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = CameraDocumentResponse.fromJson(result);
        iAcessoBioDocument?.onSuccesstDocument(response);
      } else {
        iAcessoBioDocument?.onErrorFaceMatch(result['result']);
      }
    }
  }

  //endregion

  //region AUTH

  void openLivenessAuthenticate(String code) async {
    var map = buildMap();

    map['code'] = code;

    final result = await _channel.invokeMethod('openLivenessAuthenticate', map)
        as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = AuthenticateResponse.fromJson(result);
        iAcessoBioAuthenticate?.onSuccessAuthenticate(response);
      } else {
        final error = ErrorBioResponse(result);
        iAcessoBioAuthenticate?.onErrorAuthenticate(error);
      }
    }
  }

  //endregion

  //region CAMERA

  get openCamera async {
    final result = await _channel.invokeMethod('openCamera', buildMap())
        as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = CameraResponse.fromJson(result);
        iAcessoBioCamera?.onSuccessCamera(response);
      } else {
        final error = ErrorBioResponse(result);
        iAcessoBioCamera?.onErrorCamera((error));
      }
    }
  }

  void openCameraWithCreateProcess(
    String nome,
    String code,
    String gender,
    String birthdate,
    String email,
    String phone,
  ) async {
    var map = buildMap();
    map['nome'] = nome;
    map['code'] = code;
    map['gender'] = gender;
    map['birthdate'] = birthdate;
    map['email'] = email;
    map['phone'] = phone;

    final result = await _channel.invokeMethod(
      'openCameraWithCreateProcess',
      map,
    ) as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        final response = CameraResponse.fromJson(result);
        iAcessoBioCamera?.onSuccessCamera(response);
      } else {
        final error = ErrorBioResponse(result);
        iAcessoBioCamera?.onErrorCamera(error);
      }
    }
  }

  void openCameraWithCreateProcessAndInsertDocument(
    String code,
    String nome,
    int documentType,
  ) async {
    var map = buildMap();
    map['code'] = code;
    map['nome'] = nome;
    map['DOCUMENT_TYPE'] = documentType;

    final result = await _channel.invokeMethod('openCameraInsertDocument', map)
        as Map<String, dynamic>;

    if (validResult(result)) {
      if (result['flutterstatus'] == 1) {
        iAcessoBioCamera?.onSucessDocumentInsert(
          result['processId'],
          result['typed'],
        );
      } else {
        iAcessoBioCamera?.onErrorDocumentInsert(result['result']);
      }
    }
  }

  //endregion

  //region COSTOMIZATION

  //region Android
  void setAndroidColorSilhoutte(
    String successStrokeColor,
    String errorStrokeColor,
  ) {
    androidColorSilhoutte = successStrokeColor + ';' + errorStrokeColor;
  }

  void setAndroidColorBackground(String colorBlueMask) {
    androidColorBackground = colorBlueMask;
  }

  void setAndroidColorBoxMessage(String colorWhite) {
    androidColorBoxMessage = colorWhite;
  }

  void setAndroidColorTextMessage(String colorBlack) {
    androidColorTextMessage = colorBlack;
  }

  void setAndroidColorBackgroundPopupError(String colorAccent) {
    androidColorBackgroundPopupError = colorAccent;
  }

  void setAndroidColorTextPopupError(String colorGreen) {
    androidColorTextPopupError = colorGreen;
  }

  void setAndroidColorBackgroundButtonPopupError(String redBtnBgColor) {
    androidColorBackgroundButtonPopupError = redBtnBgColor;
  }

  void setAndroidColorTextButtonPopupError(String colorPrimary) {
    androidColorTextButtonPopupError = colorPrimary;
  }

  void setAndroidColorBackgroundTakePictureButton(String colorGreyDark) {
    androidColorBackgroundTakePictureButton = colorGreyDark;
  }

  void setAndroidColorIconTakePictureButton(String colorOrange) {
    androidColorIconTakePictureButton = colorOrange;
  }

  void setAndroidColorBackgroundBottomDocument(String redBtnBgColor) {
    androidColorBackgroundBottomDocument = redBtnBgColor;
  }

  void setAndroidColorTextBottomDocument(String colorGreen) {
    androidColorTextBottomDocument = colorGreen;
  }
  //endregion

  //region IOS
  void setIosColorSilhoutteNeutra(String color) {
    iosColorSilhoutteNeutra = color;
  }

  void setIosColorSilhoutteSuccess(String color) {
    iosColorSilhoutteSuccess = color;
  }

  void setIosColorSilhoutteError(String color) {
    iosColorSilhoutteError = color;
  }

  void setIosColorBackground(String color) {
    iosColorBackground = color;
  }

  void setIosColorBackgroundBoxStatus(String color) {
    iosColorBackgroundBoxStatus = color;
  }

  void setIosColorTextBoxStatus(String color) {
    iosColorTextBoxStatus = color;
  }

  void setIosColorBackgroundPopupError(String color) {
    iosColorBackgroundPopupError = color;
  }

  void setIosColorTextPopupError(String color) {
    iosColorTextPopupError = color;
  }

  void setIosImageIconPopupError(String color) {
    iosImageIconPopupError = color;
  }
//endregion

}
