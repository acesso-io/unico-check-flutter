import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/di/injection.dart';

class _DiTestClass {}

void main() {
  test(
    'should call callMethodOpenCamera from ChannelRepository when call OpenCameraUseCase',
    () {
      final testClass = _DiTestClass();

      Injection.I.factory(() => testClass);

      final result = Injection.I.get<_DiTestClass>();

      expect(result, testClass);
    },
  );

  test(
    'should clear all factories instacies when call clearFactories',
    () {
      final testClass = _DiTestClass();
      Injection.I.factory(() => testClass);

      Injection.I.clearFactories();
    },
  );
}
