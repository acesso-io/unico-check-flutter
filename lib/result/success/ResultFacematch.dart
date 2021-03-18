
class ResultFacematch {

  String base64Selfie;
  String base64Document;
  bool status = false;

  ResultFacematch(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "Base64Selfie" || nome == "base64Selfie"){
        base64Selfie = map[nome];
      }else if(nome == "Base64Document" || nome == "base64Document"){
        base64Document = map[nome];
      }else if(nome == "Status" || nome == "status"){

        var status = map[nome];

        if(status == 1){
          status = true;
        }else if(status == true){
          status = status;
        }


      }
    }

  }



}