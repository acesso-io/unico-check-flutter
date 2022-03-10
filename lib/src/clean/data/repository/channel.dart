import 'package:unico_check/src/clean/domain/entities/prepare.dart';

abstract class Channel {
  void callMethodPrepareCamera(
      {required String method, required Prepare prepare});

  void callMethodOpenCamera(
      {required String method, required String request});
}
