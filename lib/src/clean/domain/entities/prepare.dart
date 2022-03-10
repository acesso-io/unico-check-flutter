class Prepare {

  late String _jsonName;

  Prepare(String jsonName){
    _jsonName = jsonName;
  }

  Map<dynamic, dynamic> get getPrepareCameraMap{
    return <String, String>{
      'jsonName':_jsonName
    };
  }

}