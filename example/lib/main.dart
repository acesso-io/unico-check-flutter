import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unico_check/unico_check.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'unico check',
      theme: ThemeData(
        primaryColor: Color(0xFF0B38E7),
      ),
      home: MyHomePage(title: 'unico | check'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    implements UnicoListener, UnicoSelfie, UnicoDocument {
  late UnicoCheckBuilder _unicoCheck;
  late UnicoCheckCameraOpener _opener;
  String androidJsonFileName = "unico-check-mobile-services.json";

  final _theme = UnicoTheme(
      colorSilhouetteSuccess: "#4ca832",
      colorSilhouetteError: "#fcdb03",
      colorBackground: "#3295a8");

  final _configIos = UnicoConfig(
      getProjectNumber: "getProjectNumber",
      getProjectId: "getProjectId",
      getMobileSdkAppId: "getMobileSdkAppId",
      getBundleIdentifier: "getBundleIdentifier",
      getHostInfo: "getHostInfo",
      getHostKey: "getHostKey");

  @override
  void initState() {
    super.initState();
    initUnicoCamera();
    configUnicoCamera();
  }

  void initUnicoCamera() {
    _unicoCheck = new UnicoCheck(this);
  }

  void configUnicoCamera() {
    _unicoCheck
        .setTheme(unicoTheme: _theme)
        .setUnicoConfigIos(unicoConfig: _configIos)
        .setTimeoutSession(timeoutSession: 55);
  }

  /// Unico callbacks

  @override
  void onErrorUnico(UnicoError error) {}

  @override
  void onUserClosedCameraManually() {}

  @override
  void onSystemChangedTypeCameraTimeoutFaceInference() {}

  @override
  void onSystemClosedCameraTimeoutSession() {}

  /// Selfie callbacks

  @override
  void onSuccessSelfie(ResultCamera result) {}

  @override
  void onErrorSelfie(UnicoError error) {}

  /// Document callbacks

  @override
  void onSuccessDocument(ResultCamera resultCamera) { }

  @override
  void onErrorDocument(UnicoError error) { }

  void setCameraSmart() {
    _opener = new UnicoCheck(this)
        .setAutoCapture(autoCapture: true)
        .setSmartFrame(smartFrame: true)
        .build();
  }

  void setCameraNormal() {
    _opener = new UnicoCheck(this)
        .setAutoCapture(autoCapture: false)
        .setSmartFrame(smartFrame: false)
        .build();
  }

  void setCameraSmartWithButton() {
    _opener = new UnicoCheck(this)
        .setAutoCapture(autoCapture: false)
        .setSmartFrame(smartFrame: true)
        .build();
  }

  void openCamera() {
    setCameraSmart();

    _opener.openCameraSelfie(jsonFileName: androidJsonFileName, listener: this);

  }

  void openCameraNormal() {
    _unicoCheck
        .setAutoCapture(autoCapture: false)
        .setSmartFrame(smartFrame: false)
        .build()
        .openCameraSelfie(jsonFileName: androidJsonFileName, listener: this);
  }

  void openCameraDocumentCNH() {
    _unicoCheck.build().openCameraDocument(
        jsonFileName: androidJsonFileName,
        documentType: DocumentType.CNH,
        listener: this);
  }

  void openCameraDocumentCNHFront() {
    _unicoCheck.build().openCameraDocument(
        jsonFileName: androidJsonFileName,
        documentType: DocumentType.CNH_FRENTE,
        listener: this);
  }

  void openCameraDocumentCNHVerso() {
    _unicoCheck.build().openCameraDocument(
        jsonFileName: androidJsonFileName,
        documentType: DocumentType.CNH_VERSO,
        listener: this);
  }

  void openCameraDocumentRGFront() {
    _unicoCheck.build().openCameraDocument(
        jsonFileName: androidJsonFileName,
        documentType: DocumentType.RG_FRENTE,
        listener: this);
  }

  void openCameraDocumentRGVerso() {
    _unicoCheck.build().openCameraDocument(
        jsonFileName: androidJsonFileName,
        documentType: DocumentType.RG_VERSO,
        listener: this);
  }

  void openCameraDocumentCPF() {
    _unicoCheck.build().openCameraDocument(
        jsonFileName: androidJsonFileName,
        documentType: DocumentType.CPF,
        listener: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Bem-vindo a poc do unico | check !',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: Text(
                'Teste agora nossa tecnologia:',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Camera para selfie',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCameraNormal,
                child: Text('Camera normal'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCamera,
                child: Text('Camera inteligente'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Camera para documentos',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                  onPressed: openCameraDocumentCNH,
                  child: Text('Documentos CNH')),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCameraDocumentCNHFront,
                child: Text('Documentos CNH Frente'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCameraDocumentCNHVerso,
                child: Text('Documentos CNH Verso'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCameraDocumentRGVerso,
                child: Text('Documentos RG Frente'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCameraDocumentRGVerso,
                child: Text('Documentos RG verso'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCameraDocumentCPF,
                child: Text('Documentos CPF'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      fontSize: 14,
    );
  }
}
