import 'package:unico_check/src/clean/api/unico.check.camera.dart';
import 'package:unico_check/src/clean/domain/entities/methods.constants.prepare.camera.dart';
import 'package:unico_check/src/clean/domain/entities/prepare.dart';
import 'package:unico_check/src/clean/domain/interface/prepare.camera.dart';
import 'camera/document/document.camera.listener.dart';

class UnicoCheckImpl extends UnicoCheckCamera {

  late PrepareCamera _prepareCamera;

  UnicoCheckImpl(PrepareCamera openCamera){
    _prepareCamera = openCamera;
  }

  @override
  void prepareDocumentCamera({required String jsonName, required DocumentCameraListener listener}) {
    _prepareCamera.prepareCamera(method: MethodsConstantsPrepareCamera.prepare_camera_document, prepare: new Prepare(jsonName));
  }

  @override
  void prepareSelfieCamera({required String jsonName, required listener}) {

  }
}
