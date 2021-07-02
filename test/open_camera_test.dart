import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/functions/camera.functions.dart';
import 'package:unico_check/unico_check.dart';

bool returned_in_interface = false;

void main() {
  const MethodChannel channel = MethodChannel('acessobio');
  late UnicoCheck _unico;

  TestWidgetsFlutterBinding.ensureInitialized();

  void setOnSuccessResponse(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCamera){
        return <String, dynamic>{
          'flutterstatus': 1,
          'result': "base64"
        };
      }

    });
  }
  void setOnErrorResponse(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCamera){
        return <String, dynamic>{
          'code': 0,
          'method': "method",
          'description': "description"
        };
      }

    });
  }
  void setOnCameraClosedManual(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCamera){
        return <String, dynamic>{
          'result': 0,
          'flutterstatus': -1,
        };
      }

    });
  }
  void setsystemClosedCameraTimeoutSession(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCamera){
        return <String, dynamic>{
          'result': 0,
          'flutterstatus': 3,
        };
      }

    });
  }
  void systemChangedTypeCameraTimeoutFaceInference(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCamera){
        return <String, dynamic>{
          'result': 0,
          'flutterstatus': 4,
        };
      }

    });
  }

  test('create_unico_check_config_ios', () async{

    var _config = UnicoConfig(
      iosColorSilhoutteNeutra:"#FFFF",
      iosColorSilhoutteSuccess:"#FFFF",
      iosColorSilhoutteError:"#FFFF",
      iosColorBackground:"#FFFF",
      iosColorBackgroundBoxStatus:"#FFFF",
      iosColorTextBoxStatus:"#FFFF",
      iosColorBackgroundPopupError:"#FFFF",
      iosColorTextPopupError:"#FFFF",
      iosImageIconPopupError:"#FFFF"
    );


    expect( await _config.getCommonMap["setIosColorSilhoutteNeutra"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosColorSilhoutteSuccess"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosColorSilhoutteError"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosColorBackground"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosColorBackgroundBoxStatus"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosColorTextBoxStatus"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosColorBackgroundPopupError"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosColorTextPopupError"]?.isEmpty, false);
    expect( await _config.getCommonMap["setIosImageIconPopupError"]?.isEmpty, false);


  });

  test('create_unico_check_config_android', () async {

    var _config = UnicoConfig(
        androidColorSilhoutte:"#FFFF",
        androidColorBackground:"#FFFF",
        androidColorBoxMessage:"#FFFF",
        androidColorTextMessage:"#FFFF",
        androidColorBackgroundPopupError:"#FFFF",
        androidColorTextPopupError:"#FFFF",
        androidColorBackgroundButtonPopupError:"#FFFF",
        androidColorTextButtonPopupError:"#FFFF",
        androidColorBackgroundTakePictureButton:"#FFFF",
        androidColorIconTakePictureButton:"#FFFF",
        androidColorBackgroundBottomDocument:"#FFFF",
        androidColorTextBottomDocument:"#FFFF"
    );

    expect( await _config.getCommonMap["setAndroidColorSilhoutte"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorBackground"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorBoxMessage"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorTextMessage"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorBackgroundPopupError"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorTextPopupError"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorBackgroundButtonPopupError"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorTextButtonPopupError"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorBackgroundTakePictureButton"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorIconTakePictureButton"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorBackgroundBottomDocument"]?.isEmpty, false);
    expect( await _config.getCommonMap["setAndroidColorTextBottomDocument"]?.isEmpty, false);

  });

  test('create_unico_check', () async {
    _unico = UnicoCheck(context: Results(1), config: UnicoConfig());
    expect(await _unico.runtimeType, UnicoCheck);
    expect(await _unico.camera.runtimeType, CameraFunctions);
  });

  group('CallBack', () {

    tearDown(() {
      expect(returned_in_interface, true);
      channel.setMockMethodCallHandler(null);
    });

    test('open_camera_on_success', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(context: Results(1), config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('open_camera_on_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(context: Results(0), config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('openCamera_on_camera_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(context: Results(-1), config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('openCamera_on_camera_time_session', () async {
      setsystemClosedCameraTimeoutSession();
      _unico = UnicoCheck(context: Results(3), config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    test('openCamera_on_camera_face_inference', () async {
      systemChangedTypeCameraTimeoutFaceInference();
      _unico = UnicoCheck(context: Results(4), config: UnicoConfig());
      _unico.camera!.openCamera();
    });

    //onErrorAcessoBio
    //systemClosedCameraTimeoutSession
    //systemChangedTypeCameraTimeoutFaceInference

  });


}

class Results implements IAcessoBioCamera {

  // -1 usuario fechou a camera manualmente
  // 0  onError
  // 1 onSucess

  int onTest;

  Results(this.onTest);

  @override
  void onErrorCamera(ErrorBioResponse error) async{
    if(onTest == 0){
      expect(await error.description.isEmpty, false);
      expect(await error.method.isEmpty, false);
    }else{
      expect(await true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onSuccessCamera(CameraResponse response) async{
    if(onTest == 1){
      expect(await response.base64.isEmpty, false);
    }else{
      expect(await true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse error) async {
    if(onTest == 0){
      expect(await error.description.isEmpty, false);
      expect(await error.method.isEmpty, false);
    }
    else{
      expect(await true, false);
    }
    returned_in_interface = true;
  }

  @override
  void userClosedCameraManually() async{
    if(onTest == -1){
      expect(await true,true);
    }else{
      expect(await true,false);
    }
    returned_in_interface = true;
  }

  @override
  void systemClosedCameraTimeoutSession() async{
    if(onTest == 3){
      expect(await true,true);
    }else{
      expect(await true,false);
    }
    returned_in_interface = true;
  }

  @override
  void systemChangedTypeCameraTimeoutFaceInference() async{
    if(onTest == 4){
      expect(await true,true);
    }else{
      expect(await true,false);
    }
    returned_in_interface = true;
  }

}