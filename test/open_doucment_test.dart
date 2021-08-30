import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/core/constants/response_contants.dart';
import 'package:unico_check/src/functions/document.functions.dart';
import 'package:unico_check/unico_check.dart';

bool returned_in_interface = false;

void main() {
  const MethodChannel channel = MethodChannel('acessobio');

  late UnicoCheck _unico;

  TestWidgetsFlutterBinding.ensureInitialized();

  void setOnSuccessResponse() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return <String, dynamic>{'result': "base64"};
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

  test('create_unico_check_document', () async {
    _unico = UnicoCheck(context: Results(""), config: UnicoConfig());
    expect(_unico.runtimeType, UnicoCheck);
    expect(_unico.document.runtimeType, DocumentFunctions);
  });

  group('CallBack', () {
    tearDown(() {
      expect(returned_in_interface, true);
      channel.setMockMethodCallHandler(null);
    });

    test('open_document_cnh_sucess', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onSuccessDocument),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.cnh);
    });

    test('open_document_rg_frente_success', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onSuccessDocument),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.rg_frente);
    });

    test('open_document_rg_verso_success', () async {
      setOnSuccessResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onSuccessDocument),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.rg_verso);
    });

    test('open_document_cnh_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onError), config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.cnh);
    });

    test('open_document_rg_frente_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onErrorDocument),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.rg_frente);
    });

    test('open_document_rg_verso_error', () async {
      setOnErrorResponse();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onErrorDocument),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.rg_verso);
    });

    test('open_document_cnh_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onUserClosedCameraManually),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.cnh);
    });

    test('open_document_rg_frente_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onUserClosedCameraManually),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.rg_frente);
    });

    test('open_document_rg_verso_closed_manual', () async {
      setOnCameraClosedManual();
      _unico = UnicoCheck(
          context: Results(ResponseConstants.onUserClosedCameraManually),
          config: UnicoConfig());
      _unico.document!
          .openCameraDocument(documentType: DocumentsTypeConstants.rg_verso);
    });
  });
}

class Results implements IAcessoBioDocument {
  String onTest;

  Results(this.onTest);

  @override
  void onSuccesstDocument(CameraDocumentResponse response) async {
    if (onTest == ResponseConstants.onSuccessDocument) {
      expect(response.base64.isEmpty, false);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void onErrorDocument(String error) async {
    if (onTest == ResponseConstants.onError) {
      expect(error.isEmpty, false);
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
  void userClosedCameraManually() async {
    if (onTest == ResponseConstants.onUserClosedCameraManually) {
      expect(true, true);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void systemClosedCameraTimeoutSession() async {
    if (onTest == ResponseConstants.onSystemClosedCameraTimeoutSession) {
      expect(true, true);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }

  @override
  void systemChangedTypeCameraTimeoutFaceInference() async {
    if (onTest ==
        ResponseConstants.onSystemChangedTypeCameraTimeoutFaceInference) {
      expect(true, true);
    } else {
      expect(true, false);
    }
    returned_in_interface = true;
  }
}
