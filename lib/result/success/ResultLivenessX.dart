class ResultLivenessX {
  String base64;
  String processID;
  String log;
  bool isLiveness;

  ResultLivenessX(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "base64"){
        base64 = map[nome];
      }else if(nome == "processID" || nome == "processId" ){
        processID = map[nome];
      }else if(nome == "log"){
        log = map[nome];
      }else if(nome == "isLiveness"){
        isLiveness = map[nome];
      }
    }

  }
}