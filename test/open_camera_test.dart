import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/core/constants/response_contants.dart';
import 'package:unico_check/src/functions/camera.functions.dart';
import 'package:unico_check/unico_check.dart';

bool returned_in_interface = false;

void main() {
  const MethodChannel channel = MethodChannel('acessobio');
  late UnicoCheck _unico;

  TestWidgetsFlutterBinding.ensureInitialized();

  //region MOC RESULTS
  void setOnSuccessResponse() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == MethodsChannelsConstants.openCamera) {
        return <String, dynamic>{'result': "base64"};
      }
    });
  }

  void setOnErrorResponse() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      throw PlatformException(
          code: ResponseConstants.onError,
          message: 'teste',
          details: <String, dynamic>{
            'code': 0,
            'method': "method",
            'description': "description"
          });
    });
  }

  void setOnCameraClosedManual() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      throw PlatformException(
          code: ResponseConstants.onUserClosedCameraManually,
          message: 'teste',
          details: <String, dynamic>{
            'code': 0,
            'method': "method",
            'description': "description"
          });
    });
  }

  void setsystemClosedCameraTimeoutSession() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      throw PlatformException(
          code: ResponseConstants.onSystemClosedCameraTimeoutSession,
          message: 'teste',
          details: <String, dynamic>{
            'code': 0,
            'method': "method",
            'description': "description"
          });
    });
  }

  void systemChangedTypeCameraTimeoutFaceInference() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      throw PlatformException(
          code: ResponseConstants.onSystemChangedTypeCameraTimeoutFaceInference,
          message: 'teste',
          details: <String, dynamic>{
            'code': 0,
            'method': "method",
            'description': "description"
          });
    });
  }
  //endregion

  test('create_unico_check', () async {
    _unico = UnicoCheck(context: Results(""), config: UnicoConfig());
    expect(_unico.runtimeType, UnicoCheck);
    expect(_unico.camera.runtimeType, CameraFunctions);
  });

  test('create_unico_check_config_ios', () async {
    var _config = UnicoConfig(
        iosColorBackground: "#FFF",
        iosColorBoxMessage: "#FFF",
        iosColorTextMessage: "#FFF",
        iosColorBackgroundPopupError: "#FFF",
        iosColorTextPopupError: "#FFF",
        iosColorBackgroundButtonPopupError: "#FFF",
        iosColorTextButtonPopupError: "#FFF",
        iosColorBackgroundTakePictureButton: "#FFF",
        iosColorIconTakePictureButton: "#FFF",
        iosColorBackgroundBottomDocument: "#FFF",
        iosColorTextBottomDocument: "#FFF",
        iosColorSilhouetteSuccess: "#FFF",
        iosColorSilhouetteError: "#FFF");

    expect(await _config.getCommonMap["iosColorBackground"]?.isEmpty, false);
    expect(await _config.getCommonMap["iosColorBoxMessage"]?.isEmpty, false);
    expect(await _config.getCommonMap["iosColorTextMessage"]?.isEmpty, false);
    expect(await _config.getCommonMap["iosColorBackgroundPopupError"]?.isEmpty,
        false);
    expect(
        await _config.getCommonMap["iosColorTextPopupError"]?.isEmpty, false);
    expect(
        await _config
            .getCommonMap["iosColorBackgroundButtonPopupError"]?.isEmpty,
        false);
    expect(await _config.getCommonMap["iosColorTextButtonPopupError"]?.isEmpty,
        false);
    expect(
        await _config
            .getCommonMap["iosColorBackgroundTakePictureButton"]?.isEmpty,
        false);
    expect(await _config.getCommonMap["iosColorIconTakePictureButton"]?.isEmpty,
        false);
    expect(
        await _config.getCommonMap["iosColorBackgroundBottomDocument"]?.isEmpty,
        false);
    expect(await _config.getCommonMap["iosColorTextBottomDocument"]?.isEmpty,
        false);
    expect(await _config.getCommonMap["iosColorSilhouetteSuccess"]?.isEmpty,
        false);
    expect(
        await _config.getCommonMap["iosColorSilhouetteError"]?.isEmpty, false);
  });

  test('create_unico_check_config_android', () async {
    var _config = UnicoConfig(
        androidColorBackground: "#FFF",
        androidColorBoxMessage: "#FFF",
        androidColorTextMessage: "#FFF",
        androidColorBackgroundPopupError: "#FFF",
        androidColorTextPopupError: "#FFF",
        androidColorBackgroundButtonPopupError: "#FFF",
        androidColorTextButtonPopupError: "#FFF",
        androidColorBackgroundTakePictureButton: "#FFF",
        androidColorIconTakePictureButton: "#FFF",
        androidColorBackgroundBottomDocument: "#FFF",
        androidColorTextBottomDocument: "#FFF",
        androidColorSilhouetteSuccess: "#FFF",
        androidColorSilhouetteError: "#FFF");
    expect(
        await _config.getCommonMap["androidColorBackground"]?.isEmpty, false);
    expect(
        await _config.getCommonMap["androidColorBoxMessage"]?.isEmpty, false);
    expect(
        await _config.getCommonMap["androidColorTextMessage"]?.isEmpty, false);
    expect(
        await _config.getCommonMap["androidColorBackgroundPopupError"]?.isEmpty,
        false);
    expect(await _config.getCommonMap["androidColorTextPopupError"]?.isEmpty,
        false);
    expect(
        await _config
            .getCommonMap["androidColorBackgroundButtonPopupError"]?.isEmpty,
        false);
    expect(
        await _config.getCommonMap["androidColorTextButtonPopupError"]?.isEmpty,
        false);
    expect(
        await _config
            .getCommonMap["androidColorBackgroundTakePictureButton"]?.isEmpty,
        false);
    expect(
        await _config
            .getCommonMap["androidColorIconTakePictureButton"]?.isEmpty,
        false);
    expect(
        await _config
            .getCommonMap["androidColorBackgroundBottomDocument"]?.isEmpty,
        false);
    expect(
        await _config.getCommonMap["androidColorTextBottomDocument"]?.isEmpty,
        false);
    expect(await _config.getCommonMap["androidColorSilhouetteSuccess"]?.isEmpty,
        false);
    expect(await _config.getCommonMap["androidColorSilhouetteError"]?.isEmpty,
        false);
  });

  group('CallBack', () {
    tearDown(() {
      expect(returned_in_interface, true);
      channel.setMockMethodCallHandler(null);
    });

    test('open_camera_on_success', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onSuccessSelfie),
          config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('open_camera_on_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onError), config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('openCamera_on_camera_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onUserClosedCameraManually),
          config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('openCamera_on_camera_time_session', () async {
      setsystemClosedCameraTimeoutSession();
      _unico = UnicoCheck(
          context:
              Results(ResponseConstants.onSystemClosedCameraTimeoutSession),
          config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('openCamera_on_camera_face_inference', () async {
      systemChangedTypeCameraTimeoutFaceInference();
      _unico = UnicoCheck(
          context: Results(
              ResponseConstants.onSystemChangedTypeCameraTimeoutFaceInference),
          config: UnicoConfig());
      _unico.camera!.openCamera();
    });
  });
}

class Results implements IAcessoBioSelfie {
  String onTest;

  Results(this.onTest);

  @override
  void onSuccessSelfie(CameraResponse response) async {
    if (onTest == ResponseConstants.onSuccessSelfie) {
      expect(response.base64.isEmpty, false);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onErrorSelfie(ErrorBioResponse error) async {
    if (onTest == ResponseConstants.onError) {
      expect(error.description.isEmpty, false);
      expect(error.method.isEmpty, false);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) async {
    if (onTest == ResponseConstants.onErrorAcessoBio) {
      expect(error.description.isEmpty, false);
      expect(error.method.isEmpty, false);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onUserClosedCameraManually() async {
    if (onTest == ResponseConstants.onUserClosedCameraManually) {
      expect(true, true);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onSystemClosedCameraTimeoutSession() async {
    if (onTest == ResponseConstants.onSystemClosedCameraTimeoutSession) {
      expect(true, true);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onSystemChangedTypeCameraTimeoutFaceInference() async {
    if (onTest ==
        ResponseConstants.onSystemChangedTypeCameraTimeoutFaceInference) {
      expect(true, true);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }
}
