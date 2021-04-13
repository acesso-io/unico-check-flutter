import 'package:flutter/material.dart';
import 'package:unico_check/abstracts/acesso_bio.interface.dart';
import 'package:unico_check/abstracts/acesso_bio_authenticate.interface.dart';
import 'package:unico_check/abstracts/acesso_bio_camera.interface.dart';
import 'package:unico_check/abstracts/acesso_bio_document.interface.dart';
import 'package:unico_check/abstracts/acesso_bio_liveness.interface.dart';
import 'package:unico_check/result/error/error_bio.response.dart';
import 'package:unico_check/result/success/authenticate.response.dart';
import 'package:unico_check/result/success/camera.response.dart';
import 'package:unico_check/result/success/camera_document.response.dart';
import 'package:unico_check/result/success/facematch.response.dart';
import 'package:unico_check/result/success/liveness_x.response.dart';
import 'package:unico_check/result/success/ocr.response.dart';
import 'package:unico_check/unico_check.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    implements
        IAcessoBio,
        IAcessoBioCamera,
        IAcessoBioDocument,
        IAcessoBioLiveness,
        IAcessoBioAuthenticate {
  String _result = "Esta biblioteca visa implementar a tecnologia Unico";
  UnicoCheck acessobio;

  @override
  void initState() {
    super.initState();
    initAcessoBio();
  }

  Future<void> initAcessoBio() async {
    acessobio = new UnicoCheck(
      this,
      'acessoPass.url',
      'acessoPass.apikey',
      'acessoPass.token',
    );
    customLayout();
  }

  Future<void> initLiveness() async {
    acessobio.openLiveness;
    // acessobio.openLivenessWithCreateProcess("lucas diniz","123123123123");
  }

  Future<void> initDocument() async {
    acessobio.openCameraDocumentOCR(UnicoCheck.cnh);
    // acessobio.openFaceMatch(AcessoBio.CNH);
    // acessobio.openCameraDocument(AcessoBio.CNH);
  }

  Future<void> initAuth() async {
    acessobio.openLivenessAuthenticate("12345678909");
  }

  Future<void> initCamera() async {
    acessobio.openCamera;
    // acessobio.openCameraWithCreateProcess("lucas", "12345678909",null,null,null,null);
    // acessobio.openCameraWithCreateProcessAndInsertDocument("12345678909", "Lucas Diniz", AcessoBio.CNH);// no IOS ainda nao foi inplementado // retornando na interface errada
  }

  Future<void> customLayout() async {
    // --- CUSTOM LAYOUT Android
    // acessobio.setAndroidColorSilhoutte("#87CEFA","#87CEFA");
    // acessobio.setAndroidColorBackground("#901850");
    // acessobio.setAndroidColorBoxMessage("#901850");
    // acessobio.setAndroidColorTextMessage("#901850");
    // acessobio.setAndroidColorBackgroundPopupError("#901850");
    // acessobio.setAndroidColorTextPopupError("#901850");
    // acessobio.setAndroidColorBackgroundButtonPopupError("#901850");
    // acessobio.setAndroidColorTextButtonPopupError("#901850");
    // acessobio.setAndroidColorBackgroundTakePictureButton("#901850");
    // acessobio.setAndroidColorIconTakePictureButton("#901850");
    // acessobio.setAndroidColorBackgroundBottomDocument("#901850");
    // acessobio.setAndroidColorTextBottomDocument("#901850");

    // --- CUSTOM LAYOUT IOS
    // acessobio.setIosColorSilhoutteNeutra("#901850");
    // acessobio.setIosColorSilhoutteSuccess("#901850");
    // acessobio.setIosColorSilhoutteError("#901850");
    // acessobio.setIosColorBackground("#901850");
    // acessobio.setIosColorBackgroundBoxStatus("#901850");
    // acessobio.setIosColorTextBoxStatus("#901850");
    // acessobio.setIosColorBackgroundPopupError("#901850");
    // acessobio.setIosColorTextPopupError("#901850");
    // acessobio.setIosImageIconPopupError("#901850");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app unico'),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: initLiveness,
                icon: Icon(Icons.camera, size: 18),
                label: Text("Open Liveness"),
              ),
              ElevatedButton.icon(
                onPressed: initDocument,
                icon: Icon(Icons.pages, size: 18),
                label: Text("Open Document"),
              ),
              ElevatedButton.icon(
                onPressed: initCamera,
                icon: Icon(Icons.camera, size: 18),
                label: Text("Open Camera"),
              ),
              Padding(
                padding: const EdgeInsets.all(95),
                child: Text('$_result\n'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onErrorAcessoBio(ErrorBioResponse errorBioResponse) {}

  @override
  void userClosedCameraManually() {}

  @override
  void onErrorCamera(ErrorBioResponse errorBioResponse) {}

  @override
  void onErrorDocumentInsert(String error) {}

  @override
  void onSuccessCamera(CameraResponse result) {}

  @override
  void onSucessDocumentInsert(String processId, String typed) {}

  //endregion

  //region -- IAcessoBioDocument
  @override
  void onErrorDocument(String error) {}

  @override
  void onErrorFaceMatch(String error) {}

  @override
  void onErrorOCR(String error) {}

  @override
  void onSuccessFaceMatch(FacematchResponse result) {}

  @override
  void onSuccessOCR(OCRResponse ocr) {}

  @override
  void onSuccesstDocument(CameraDocumentResponse result) {}

  @override
  void onErrorLiveness(ErrorBioResponse errorBioResponse) {}

  @override
  void onSuccessLiveness(LivenessXResponse result) {}

  @override
  void onErrorAuthenticate(ErrorBioResponse errorBioResponse) {}

  @override
  void onSuccessAuthenticate(AuthenticateResponse result) {}
}
