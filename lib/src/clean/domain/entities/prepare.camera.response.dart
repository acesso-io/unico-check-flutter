import 'package:unico_check/src/clean/domain/entities/unico.error.dart';

enum cameraResponse { success, code, message }

class PrepareCameraResponse {
  late bool _success;
  late UnicoError? _error;
  
  bool getSuccess() {
    return _success;
  }

  UnicoError? getUnicoError() {
    return _error;
  }

  Future<PrepareCameraResponse> getPrepare(Future<Map<dynamic, dynamic>> map) async {

    Map<dynamic, dynamic> mymap = map;

    await map[cameraResponse.success]

    return mymap
  }

  PrepareCameraResponse getValue(Map value) {
    try {
      if (value[cameraResponse.success] == true) {
        _success = true;
        _error = null;
      } else {
        _success = false;
        _error = new UnicoError(
            value[cameraResponse.code], value[cameraResponse.message]);
      }
      return this;
    } catch (e) {
      _success = false;
      _error = new UnicoError(00, "");
      return this;
    }
  }



