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
    implements IAcessoBioSelfie, IAcessoBioDocument {
  late UnicoCheck unicoCheck;
  final unicoConfig = UnicoConfig(
    // setTimeoutSession: 50.0,
    // setTimeoutToFaceInference: 16.0,
    // androidColorSilhouetteSuccess: "#03fc73",
    // androidColorSilhouetteError: "#fc0303",
    // iosColorSilhouetteSuccess: "#03fc73",
    // iosColorSilhouetteError: "#fc0303",
  );

  @override
  void initState() {
    super.initState();
    initAcessoBio();
  }

  void initAcessoBio() {
    unicoCheck = new UnicoCheck(context: this, config: unicoConfig);
  }

  void openCamera() {
    unicoCheck.camera!.setAutoCapture(true);
    unicoCheck.camera!.setSmartFrame(true);
    unicoCheck.camera!.openCamera();
  }

  void openCameraNormal() {
    unicoCheck.camera!.setAutoCapture(false);
    unicoCheck.camera!.setSmartFrame(false);
    unicoCheck.camera!.openCamera();
  }

  void openCameraDocumentCNH() {
    unicoCheck.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  void openCameraDocumentRGfrente() {
    unicoCheck.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  void openCameraDocumentRGverso() {
    unicoCheck.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
                  onPressed: openCameraDocumentRGfrente,
                  child: Text('Documentos RG Frente'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  onPressed: openCameraDocumentRGverso,
                  child: Text('Documentos RG verso'),
                  color: Color(0xFF1172EB),
                  textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  ///Acessobio callbacks
  void onErrorAcessoBio(ErrorBioResponse error) {
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
  void onSuccessSelfie(CameraResponse response) {
    showToast("Sucesso na captura, aqui temos o base64");
  }

  @override
  void onErrorSelfie(ErrorBioResponse error) {
    showToast("Erro ao abrir a camera: " + error.description);
  }

  ///Document callbacks
  @override
  void onSuccessDocument(CameraDocumentResponse response) {
    showToast("Sucesso na captura, aqui temos o base64");
  }

  @override
  void onErrorDocument(ErrorBioResponse error) {
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
