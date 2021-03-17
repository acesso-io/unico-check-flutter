

class ErrorBio {

  int code = null;
  String method = null;
  String description = null;

  ErrorBio(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "code"){
        code = map[nome];
      }else if(nome == "method"){
        method = map[nome];
      }else if(nome == "description"){
        description = map[nome];
      }else if(nome == "result"){
        description = map[nome];
      }
    }

  }


}