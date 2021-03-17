
class ResultCameraDocument {

  String base64 = null;

  ResultCameraDocument(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "result"){ //base64
        base64 = map[nome];
      }
    }

  }



}