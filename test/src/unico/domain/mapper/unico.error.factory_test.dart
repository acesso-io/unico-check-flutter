
import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/domain/mapper/unico.error.factory.dart';

void main() {

  test('should build and return UnicoError when call buildUnicoError', () {
    final factory = UnicoErrorFactory();

    final result = factory.buildUnicoError(0, 'description');
    expect(result.code, 0);
    expect(result.description, 'description');
  });
}