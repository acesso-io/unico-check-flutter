import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unico_check/src/unico/plugins/channel/channel.unico.default.dart';

import '../../../test_dummy.dart';

void main() {
  late MethodChannel channel;
  late ChannelUnicoDefault channelUnicoDefault;

  setUp(() {
    channel = MockMethodChannel();
    channelUnicoDefault = ChannelUnicoDefault(channel);
  });

  test(
    'should call native method with success from MethodChannel when call callMethod',
    () async {
      const String method = dummyString;
      final Map<dynamic, dynamic> request = {};
      final Map<dynamic, dynamic> response = {dummyString: dummyString};
      final listener = MockChannelResultListener();
      //  Given
      when(() => channel.setMethodCallHandler(any())).thenAnswer((invocation) {});
      when(() => channel.invokeMethod(
            method,
            request,
          )).thenAnswer((invocation) async => response);
      //  When
      channelUnicoDefault.callMethod(
        method: method,
        request: request,
        listener: listener,
      );
      //  Then
      verify(() => channel.setMethodCallHandler(any())).called(1);
      verify(() => channel.invokeMethod(method, request)).called(1);
    },
  );

  test(
    'should call native method with failure from MethodChannel when call callMethod',
    () async {
      const String method = dummyString;
      final Map<dynamic, dynamic> request = {};
      final response = FakePlatformException();
      final listener = MockChannelResultListener();
      //  Given
      when(() => channel.setMethodCallHandler(any())).thenAnswer((invocation) {});
      when(() => channel.invokeMethod(
            method,
            request,
          )).thenThrow(response);
      when(() => channel.invokeMethod(
            method,
            request,
          )).thenThrow(response);
      when(() => listener.onChannelResult(any())).thenAnswer((invocation) {});
      //  When
      channelUnicoDefault.callMethod(
        method: method,
        request: request,
        listener: listener,
      );
      //  Then
      verify(() => channel.setMethodCallHandler(any())).called(1);
      verify(() => channel.invokeMethod(method, request)).called(1);
      verify(() => listener.onChannelResult(any())).called(1);
    },
  );
}
