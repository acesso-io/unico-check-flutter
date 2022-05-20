import 'package:unico_check/src/clean/api/response/document/unico.document.dart';
import 'package:unico_check/src/clean/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/clean/domain/entities/channel.result.dart';
import 'package:unico_check/src/clean/domain/entities/document.type.dart';
import 'package:unico_check/src/clean/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/clean/domain/entities/unico.config.dart';
import 'package:unico_check/src/clean/domain/usecase/open.camera.usecase.dart';
import 'unico.check.camera.opener.dart';

class UnicoCheckCameraOpenerDefault extends UnicoCheckCameraOpener {
  late OpenCameraUseCase _openCamera;
  late OpenCameraRequest _openCameraRequest;
  late UnicoConfig _unicoConfig;
  late bool _autoCaptrue;
  late bool _smartFrame;

  UnicoCheckCameraOpenerDefault({
    required OpenCameraUseCase openCameraUseCase,
    required OpenCameraRequest openCameraRequest,
    required UnicoConfig unicoConfig,
    required bool autoCaptrue,
    required bool smartFrame,
  }) {
    _openCamera = openCameraUseCase;
    _openCameraRequest = openCameraRequest;
    _unicoConfig = unicoConfig;
    _autoCaptrue = autoCaptrue;
    _smartFrame = smartFrame;
  }

  @override
  void openCameraSelfie(
      {required String jsonFileName, required UnicoSelfie listener}) {
    _openCameraRequest.setJsonFilneName(jsonFileName);
    _openCameraRequest.setUnicoConfig(_unicoConfig);
    _openCamera.openCamera(request: _openCameraRequest).then((value) =>
        returnResponse(listener, value)
    );
  }

  void returnResponse(UnicoSelfie listener, ChannelResult channelResult){
    if(channelResult.unicoError != null){
      listener.onSuccessSelfie(channelResult.resultCamera!);
    }else{
      listener.onErrorSelfie(channelResult.unicoError!);
    }
  }

  @override
  void openCameraDocument(
      {required String jsonFileName,
      required DocumentType documentType,
      required UnicoDocument listener}) {}
}
