import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/core/constants/map.constants.dart';
import 'package:unico_check/src/core/constants/methods_channels.constants.dart';
import 'package:unico_check/src/functions/document.functions.dart';
import 'package:unico_check/unico_check.dart';

// class MockBuildContext extends Mock implements BuildContext {}

bool returned_in_interface = false;


void main() {
  const MethodChannel channel = MethodChannel('acessobio');

  late UnicoCheck _unico;

  TestWidgetsFlutterBinding.ensureInitialized();


  void setOnSuccessResponse(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCameraDocument){
        return <String, dynamic>{
          'flutterstatus': 1,
          'result': "base64"
        };
      }

    });
  }
  void setOnErrorResponse(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCameraDocument){
        return <String, dynamic>{
          'flutterstatus': 0,
          'result': "description"
        };
      }

    });
  }
  void setOnCameraClosedManual(){
    channel.setMockMethodCallHandler((MethodCall methodCall) async {

      if(methodCall.method == MethodsChannelsConstants.openCameraDocument){
        return <String, dynamic>{
          'result': 0,
          'flutterstatus': -1,
        };
      }

    });
  }


  test('create_unico_check_document', () async {
    _unico = UnicoCheck(context: Results(1), config: UnicoConfig());
    expect(await _unico.runtimeType, UnicoCheck);
    expect(await _unico.document.runtimeType, DocumentFunctions);
  });

  group('CallBack', () {

    tearDown(() {
      expect(returned_in_interface, true);
      channel.setMockMethodCallHandler(null);
    });

    test('open_document_cnh_sucess', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(context: Results(1), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.cnh);

    });

    //region on success
    test('open_document_rg_frente_success', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(context: Results(1), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.rg_frente);

    });


    test('open_document_rg_verso_success', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(context: Results(1), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.rg_verso);
    });
   //endregion

    //region on error
    test('open_document_cnh_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(context: Results(0), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.cnh);
    });

    test('open_document_rg_frente_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(context: Results(0), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.rg_frente);
    });

    test('open_document_rg_verso_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(context: Results(0), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.rg_verso);
    });
    //endregion

    //region camera closed manual
    test('open_document_cnh_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(context: Results(-1), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.cnh);
    });

    test('open_document_rg_frente_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(context: Results(-1), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.rg_frente);
    });

    test('open_document_rg_verso_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(context: Results(-1), config: UnicoConfig());
      _unico.document!.openCameraDocument(documentType: DocumentsTypeConstants.rg_verso);
    });
    //endregion

  });


}

class Results implements IAcessoBioDocument {

  // -1 usuario fechou a camera manualmente
  // 0  onError
  // 1 onSucess

  int onTest;

  Results(this.onTest);

  @override
  void onErrorDocument(String error) async {
    if(onTest == 0){
      expect(await error.isEmpty, false);
    }else{
      expect(await true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onSuccesstDocument(CameraDocumentResponse response) async{
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

}
