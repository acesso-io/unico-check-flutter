
class OCRResponse {

  String BirthDate;
  String PlaceOfBirth;
  String Category;
  String ExpeditionCity;
  String ExpeditionState;
  String ExpeditionDate;
  String ExpirationDate;
  String FatherName;
  String MotherName;
  String FirstLicenseDate;
  String Name;
  String RG;
  String Code;
  String RegistrationNumber;
  String Renach;
  String SecurityCode;
  String MirrorNumber;
  String Observation;

  OCRResponse(Map<dynamic, dynamic> map){

    for(String nome in map.keys){

           if(nome == "BirthDate"){ BirthDate = map[nome];}
      else if(nome == "PlaceOfBirth"){ PlaceOfBirth = map[nome];}
      else if(nome == "Category"){ Category = map[nome];}
      else if(nome == "ExpeditionCity"){ ExpeditionCity = map[nome];}
      else if(nome == "ExpeditionState"){ ExpeditionState = map[nome];}
      else if(nome == "ExpeditionDate"){ ExpeditionDate = map[nome];}
      else if(nome == "ExpirationDate"){ ExpirationDate = map[nome];}
      else if(nome == "FatherName"){ FatherName = map[nome];}
      else if(nome == "MotherName"){ MotherName = map[nome];}
      else if(nome == "FirstLicenseDate"){ FirstLicenseDate = map[nome];}
      else if(nome == "Name"){ Name = map[nome];}
      else if(nome == "RG"){ RG = map[nome];}
      else if(nome == "Code"){ Code = map[nome];}
      else if(nome == "RegistrationNumber"){ RegistrationNumber = map[nome];}
      else if(nome == "Renach"){ Renach = map[nome];}
      else if(nome == "SecurityCode"){ SecurityCode = map[nome];}
      else if(nome == "MirrorNumber"){ MirrorNumber = map[nome];}
      else if(nome == "Observation"){ Observation = map[nome];}

    }

  }


}