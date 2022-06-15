import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/adapter/api/mapper/open.check.camera.factory.dart';
import 'package:unico_check/src/unico/adapter/api/response/document/unico.document.dart';
import 'package:unico_check/src/unico/adapter/api/response/selfie/unico.selfie.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/domain/entities/methods.channel.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

import '../../../../test_dummy.dart';

void main() {
  late OpenCheckCameraFactory openCheckCameraFactory;

  setUp(() {
    openCheckCameraFactory = OpenCheckCameraFactory();
  });

  test('should build camera callback confing entity', () {
    final UnicoErrorChannel unicoError = MockUnicoErrorChannel();
    final UnicoListener unicoListener = MockUnicoListener();
    final UnicoSelfie listenerSelfie = MockUnicoSelfie();
    final UnicoDocument listenerDocument = MockUnicoDocument();

    final result = openCheckCameraFactory.buildCameraCallbackConfingEntity(
      unicoError: unicoError,
      listenerSelfie: listenerSelfie,
      listenerDocument: listenerDocument,
      unicoListener: unicoListener,
    );

    expect(result.unicoError, unicoError);
    expect(result.listenerSelfie, listenerSelfie);
    expect(result.listenerDocument, listenerDocument);
    expect(result.unicoListener, unicoListener);
  });

  test('should build open camera confing entity', () {
    final request = MockOpenCameraRequest();
    const methodsChannel = MethodsChannel.open_camera_selfie;
    final openCameraeListener = MockIOpenCameraeListener();

    final result = openCheckCameraFactory.buildOpenCameraConfigEntity(
      request,
      methodsChannel,
      openCameraeListener,
    );

    expect(
      result.request,
      request,
    );
    expect(result.methodsChannel, methodsChannel);
    expect(result.openCameraeListener, openCameraeListener);
  });
}
