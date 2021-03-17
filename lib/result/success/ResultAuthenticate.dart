class ResultAuthenticate {

  String base64;
  bool status;
  bool isLiveness;

  ResultAuthenticate(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "base64"){
        base64 = map[nome];
      }else if(nome == "status"){
        status = map[nome];
      }else if(nome == "isLiveness"){
        isLiveness = map[nome];
      }
    }

  }

}