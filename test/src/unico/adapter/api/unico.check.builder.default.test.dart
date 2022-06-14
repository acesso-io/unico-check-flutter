

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.builder.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/di/module.dart';
import 'package:unico_check/src/unico/domain/entities/unico.config.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

class MockUnicoListener extends Mock implements UnicoListener {}
class MockUnicoConfig extends Mock implements UnicoConfig {}

void main() {
  
  late UnicoCheck unicoCheck;
  late UnicoListener listener;

  setUp(() {
    Module.initDependencies();
    listener = MockUnicoListener();
  });

  test('should set auto capture when setAutoCapture method is called', () {
    unicoCheck = UnicoCheck(listener);

    unicoCheck.setUnicoConfigIos(unicoConfig: MockUnicoConfig())
        .setUnicoConfigAndroid(unicoConfig: MockUnicoConfig())
        .setAutoCapture(autoCapture: true).build();
  });

  test('should set smart frame when setSmartFrame method is called', () {
    unicoCheck = UnicoCheck(listener);

    unicoCheck.setUnicoConfigIos(unicoConfig: MockUnicoConfig())
        .setUnicoConfigAndroid(unicoConfig: MockUnicoConfig())
        .setSmartFrame(smartFrame: true).build();
  });

  test('should set theme when setTheme method is called', () {
    unicoCheck = UnicoCheck(listener);

    unicoCheck.setUnicoConfigIos(unicoConfig: MockUnicoConfig())
        .setUnicoConfigAndroid(unicoConfig: MockUnicoConfig())
        .setTheme(unicoTheme: UnicoTheme()).build();
  });
  
  tearDown(() {
    Module.tearDownDependencies();
  });
}