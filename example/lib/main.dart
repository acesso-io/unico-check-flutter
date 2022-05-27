import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unico_check/unico_check.dart';

import 'keys.dart';

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
    implements UnicoListener, UnicoDocument, UnicoSelfie {
  late UnicoCheckBuilder unicoCheck;
  String jsonName = "unico-check-mobile-services.json";

  final theme = UnicoTheme(
      colorSilhouetteSuccess: "#4ca832",
      colorSilhouetteError: "#fcdb03",
      colorBackground: "#3295a8"
  );

  final config = UnicoConfig(
      getProjectNumber: getProjectNumber,
      getProjectId: getProjectId,
      getMobileSdkAppId: getMobileSdkAppId,
      getBundleIdentifier: getBundleIdentifier,
      getHostInfo: getHostInfo,
      getHostKey: getHostKey
  );

  @override
  void initState() {
    super.initState();
    initAcessoBio();
  }

  void initAcessoBio() {
    unicoCheck = new UnicoCheck(this).setTheme(unicoTheme: theme).setUnicoConfig(unicoConfig: config);
  }

  void openCamera() {
    unicoCheck
        .setAutoCapture(autoCapture: true)
        .setSmartFrame(smartFrame: true)
        .build()
        .openCameraSelfie(jsonFileName: jsonName, listener: this);
  }

  void openCameraNormal() {
    unicoCheck
        .setAutoCapture(autoCapture: false)
        .setSmartFrame(smartFrame: false)
        .build()
        .openCameraSelfie(jsonFileName: jsonName, listener: this);
  }

  void openCameraDocumentCNH() {
    unicoCheck.build().openCameraDocument(
        jsonFileName: jsonName, documentType: DocumentType.CNH, listener: this);
  }

  void openCameraDocumentCNHFrente() {
    unicoCheck.build().openCameraDocument(
        jsonFileName: jsonName,
        documentType: DocumentType.CNH_FRENTE,
        listener: this);
  }

  void openCameraDocumentCNHVerso() {
    unicoCheck.build().openCameraDocument(
        jsonFileName: jsonName,
        documentType: DocumentType.CNH_VERSO,
        listener: this);
  }

  void openCameraDocumentRGFrente() {
    unicoCheck.build().openCameraDocument(
        jsonFileName: jsonName,
        documentType: DocumentType.RG_FRENTE,
        listener: this);
  }

  void openCameraDocumentRGVerso() {
    unicoCheck.build().openCameraDocument(
        jsonFileName: jsonName,
        documentType: DocumentType.RG_VERSO,
        listener: this);
  }

  void openCameraDocumentCPF() {
    unicoCheck.build().openCameraDocument(
        jsonFileName: jsonName, documentType: DocumentType.CPF, listener: this);
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
              child: FlatButton(
                onPressed: openCameraNormal,
                child: Text('Camera normal'),
                color: Color(0xFF1172EB),
                textColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: openCamera,
                  child: Text('Camera inteligente'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
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
              child: FlatButton(
                  onPressed: openCameraDocumentCNH,
                  child: Text('Documentos CNH'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: openCameraDocumentCNHFrente,
                  child: Text('Documentos CNH Frente'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: openCameraDocumentCNHVerso,
                  child: Text('Documentos CNH Verso'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: openCameraDocumentRGFrente,
                  child: Text('Documentos RG Frente'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: openCameraDocumentRGVerso,
                  child: Text('Documentos RG verso'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: openCameraDocumentCPF,
                  child: Text('Documentos CPF'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  ///Unico callbacks
  void onErrorAcessoBio(UnicoError error) {
    showToast("Erro ao abrir a camera: " + error.description);
  }

  @override
  void onSystemChangedTypeCameraTimeoutFaceInference() {
    showToast("Sistema trocou o tipo da camera !");
  }

  @override
  void onSystemClosedCameraTimeoutSession() {
    showToast("Sistema fechou a camera !");
  }

  @override
  void onUserClosedCameraManually() {
    showToast("Usuario fechou camera manualmente !");
  }

  ///Selfie callbacks
  @override
  void onSuccessSelfie(ResultCamera result) {
    showToast("Sucesso na captura, aqui temos o base64 e encrypted ");
  }

  @override
  void onErrorSelfie(UnicoError result) {
    showToast("Erro ao abrir a camera: " + result.description);
  }

  ///Document callbacks
  @override
  void onSuccessDocument(ResultCamera base64) {
    showToast("Sucesso na captura, aqui temos o base64 e encrypted ");
  }

  @override
  void onErrorDocument(UnicoError error) {
    showToast("Erro ao abrir a camera: " + error.description);
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
