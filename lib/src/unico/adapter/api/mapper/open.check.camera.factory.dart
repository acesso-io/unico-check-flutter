import 'package:unico_check/src/unico/abstractions/interfaces/open.camera.listener.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/domain/entities/camera_callback/camera.callback.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/entities/open_camera/open.camera.config.entity.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

import '../unico.listener.dart';

class OpenCheckCameraFactory {
  CameraCallbackConfingEntity buildCameraCallbackConfingEntity({
    UnicoErrorChannel? unicoError,
    required UnicoListener unicoListener,
    UnicoSelfie? listenerSelfie,
    UnicoDocument? listenerDocument,
  }) {
    return CameraCallbackConfingEntity(
      unicoError: unicoError,
      unicoListener: unicoListener,
      listenerSelfie: listenerSelfie,
      listenerDocument: listenerDocument,
    );
  }

  OpenCameraConfigEntity buildOpenCameraConfigEntity(
    OpenCameraRequest request,
    MethodsChannel methodsChannel,
    IOpenCameraeListener openCameraeListener,
  ) {
    return OpenCameraConfigEntity(
      request,
      methodsChannel,
      openCameraeListener,
    );
  }
}
