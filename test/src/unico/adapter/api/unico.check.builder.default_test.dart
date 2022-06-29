import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/adapter/api/unico.check.builder.default.dart';
import 'package:unico_check/src/unico/adapter/api/unico.listener.dart';
import 'package:unico_check/src/unico/di/module.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

import '../../../test_dummy.dart';

void main() {
  final unicoConfigIos = MockUnicoConfig();
  final unicoConfigAndroid = MockUnicoConfig();

  late UnicoCheck unicoCheck;
  late UnicoListener listener;

  setUp(() {
    Module.initDependencies();
    listener = MockUnicoListener();
    unicoCheck = UnicoCheck(
      listener: listener,
      unicoConfigAndroid: unicoConfigAndroid,
      unicoConfigIos: unicoConfigIos,
    );
  });

  test('should set auto capture when setAutoCapture method is called', () {
    unicoCheck.setAutoCapture(autoCapture: true).build();

    expect(unicoCheck.autoCapture, true);
  });

  test('should set smart frame when setSmartFrame method is called', () {
    unicoCheck.setSmartFrame(smartFrame: true);

    expect(unicoCheck.smartFrame, true);
  });

  test('should set theme when setTheme method is called', () {
    final unicoTheme = UnicoTheme();
    unicoCheck.setTheme(unicoTheme: unicoTheme);

    expect(unicoCheck.unicoTheme, unicoTheme);
  });

  test('should set timeout session when setTimeoutSession method is called',
      () {
    unicoCheck.setTimeoutSession(timeoutSession: 1.0);

    expect(unicoCheck.timeoutSession, 1.0);
  });

  tearDown(() {
    Module.tearDownDependencies();
  });
}
