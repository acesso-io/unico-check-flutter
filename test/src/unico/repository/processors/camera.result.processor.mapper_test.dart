import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/domain/entities/result.camera.dart';
import 'package:unico_check/src/unico/domain/entities/unico.error.channel.dart';

import '../../../test_dummy.dart';

void main() {
  late CameraResultProcessorMapper mapper;

  setUp(() {
    mapper = CameraResultProcessorMapper();
  });

  test('should map to ResultCamera when onSuccess is called', () {
    final Map<String, String> map = {
      ResultCamera.mapBase64: ResultCamera.mapBase64,
      ResultCamera.mapEncrypted: ResultCamera.mapEncrypted,
    };
    //  When
    final restul = mapper.onSuccess(map);
    //  Then
    expect(restul.base64, ResultCamera.mapBase64);
    expect(restul.encrypted, ResultCamera.mapEncrypted);
  });

  test('should map to ResultCamera when onSuccess is called and exist unicoError', () {
    final Map<String, dynamic> map = {
      UnicoErrorChannel.unicoError: {
        UnicoErrorChannel.mapCode: 0,
        UnicoErrorChannel.mapDescription: UnicoErrorChannel.mapDescription,
      },
      UnicoErrorChannel.errorMethod: UnicoErrorChannel.errorMethod,
    };
    //  When
    final restul = mapper.onError(map);
    //  Then
    expect(restul?.code, 0);
    expect(restul?.description, UnicoErrorChannel.mapDescription);
    expect(restul?.methodName, UnicoErrorChannel.errorMethod);
  });

  test(
      'should map to ResultCamera when onSuccess is called and unicoError does not exist',
      () {
    final Map<String, dynamic> map = {
      UnicoErrorChannel.errorMethod: UnicoErrorChannel.errorMethod,
    };
    //  When
    final restul = mapper.onError(map);
    //  Then
    expect(restul?.code, 0);
    expect(restul?.description, '');
    expect(restul?.methodName, UnicoErrorChannel.errorMethod);
  });

  test('should map to ResultCamera when onSuccess and result is null', () {
    final Map<String, dynamic> map = {};
    //  When
    final restul = mapper.onError(map);
    //  Then
    expect(restul, null);
  });

  test('should get default error when call getDefaultErrorChanel', () {
    final result = mapper.getDefaultErrorChanel(
      code: 0,
      description: dummyString,
      methodName: dummyString,
    );

    expect(result.code, 0);
    expect(result.description, dummyString);
    expect(result.methodName, dummyString);
  });
}
