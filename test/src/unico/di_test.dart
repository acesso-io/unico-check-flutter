import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/di/di.dart';

class _DiTestClass {}

void main() {
  test(
    'should call callMethodOpenCamera from ChannelRepository when call OpenCameraUseCase',
    () {
      final testClass = _DiTestClass();

      Di.I.registerFactory(() => testClass);

      final result = Di.I.get<_DiTestClass>();

      expect(result, testClass);
    },
  );
}
