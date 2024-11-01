import 'package:flutter/material.dart';
import 'package:unico_check/unico_check.dart';
import 'package:unico_check/src/unico/domain/entities/unico.locale.types.dart';
import 'package:unico_check/src/unico/domain/entities/unico.environment.dart';

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
      home: One(title: 'One'),
    );
  }
}

class One extends StatelessWidget {
  One({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Two(title: 'Two')),
            );
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

class Two extends StatelessWidget {
  Two({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Three(title: 'Three'), fullscreenDialog: true),
            );
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

class Three extends StatelessWidget {
  Three({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'unico | check')),
            );
          },
          child: const Text('Go!'),
        ),
      ),
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

  final _theme = UnicoTheme(
      colorSilhouetteSuccess: "#4ca832",
      colorSilhouetteError: "#fcdb03",
      colorTextMessage: '#000000',
      colorBackground: "#3295a8");

  final _configIos = UnicoConfig(
    getBundleIdentifier: "io.unico.unico-check-flutter",
    getHostKey: "sdkKey_fef55157-2750-4642-892f-88024b86f029");

  final _configAndroid = UnicoConfig(
    getProjectNumber: "20134421840665432",
    getProjectId: "Flutter Android",
    getMobileSdkAppId: "j_2cdba0f1-e3de-4421-8f40-e665fefcf432",
    getBundleIdentifier: "com.unico_check_example",
    getHostInfo: "nRMqSJJeWMZ0K4n9Dxs/Zhb5RslAxes+pmH0gJgmVtbdRrszm5hV9d4KpdQ4JJz/",
    getHostKey: "L3FXDmZ4bewdis7YS4RrAZxHGlYeDbDBw8Ha3rPCioyB/K9x0GEwPo3/GKlZQhzU");

  @override
  void initState() {
    super.initState();
    initUnicoCamera();
    configUnicoCamera();
  }

  void initUnicoCamera() {
    _unicoCheck = new UnicoCheck(
        listener: this,
        unicoConfigIos: _configIos,
        unicoConfigAndroid: _configAndroid);
  }

  void configUnicoCamera() {
    _unicoCheck
        .setTheme(unicoTheme: _theme)
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
  void onSuccessDocument(ResultCamera resultCamera) {}

  @override
  void onErrorDocument(UnicoError error) {}

  void setCameraSmart() {
    _opener = _unicoCheck
        .setAutoCapture(autoCapture: true)
        .setSmartFrame(smartFrame: true)
        .build();
  }

  void setCameraNormal() {
    _opener = _unicoCheck
        .setAutoCapture(autoCapture: false)
        .setSmartFrame(smartFrame: false)
        // .setLocale(unicoLocaleTypes: UnicoLocaleTypes.PT_BR)
        .setEnvironment(unicoEnvironment: UnicoEnvironment.UAT)
        .build();
  }

// UAT, PROD, DEV
// 
// EN_US, ES_ES, ES_MX, PT_BR,

  void setCameraSmartWithButton() {
    _opener = _unicoCheck
        .setAutoCapture(autoCapture: false)
        .setSmartFrame(smartFrame: true)
        .build();
  }

  void openCamera() {
    setCameraSmart();
    _opener.openCameraSelfie(listener: this);
  }

  void openCameraNormal() {
    setCameraNormal();
    _opener.openCameraSelfie(listener: this);
  }

  void openCameraSmartWithButton() {
    setCameraSmartWithButton();
    _opener.openCameraSelfie(listener: this);
  }

  void openCameraDocumentCNH() {
    _unicoCheck
        .build()
        .openCameraDocument(documentType: DocumentType.CNH, listener: this);
  }

  void openCameraDocumentCNHFront() {
    _unicoCheck.build().openCameraDocument(
        documentType: DocumentType.CNH_FRENTE, listener: this);
  }

  void openCameraDocumentCNHVerso() {
    _unicoCheck.build().openCameraDocument(
        documentType: DocumentType.CNH_VERSO, listener: this);
  }

  void openCameraDocumentRGFront() {
    _unicoCheck.build().openCameraDocument(
        documentType: DocumentType.RG_FRENTE, listener: this);
  }

  void openCameraDocumentRGVerso() {
    _unicoCheck.build().openCameraDocument(
        documentType: DocumentType.RG_VERSO, listener: this);
  }

  void openCameraDocumentCPF() {
    _unicoCheck
        .build()
        .openCameraDocument(documentType: DocumentType.CPF, listener: this);
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
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: openCameraSmartWithButton,
                child: Text('Camera smart button'),
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
                onPressed: openCameraDocumentRGFront,
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
}
