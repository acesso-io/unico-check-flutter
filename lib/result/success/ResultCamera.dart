

class ResultCamera {

  String base64 = null;
  String processID = null;

  ResultCamera(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "base64"){
        base64 = map[nome];
      }else if(nome == "processID"){
        processID = map[nome];
      }
    }

  }



}