
class ResultFacematch {

  String Base64Selfie = null;
  String Base64Document = null;
  bool Status = false;

  ResultFacematch(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "Base64Selfie" || nome == "base64Selfie"){
        Base64Selfie = map[nome];
      }else if(nome == "Base64Document" || nome == "base64Document"){
        Base64Document = map[nome];
      }else if(nome == "Status" || nome == "status"){

        var status = map[nome];

        if(status == 1){
          Status = true;
        }else if(status == true){
          Status = status;
        }


      }
    }

  }



}