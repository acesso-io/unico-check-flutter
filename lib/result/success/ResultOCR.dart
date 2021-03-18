
class ResultOCR {

  String birthDate;
  String placeOfBirth;
  String category;
  String expeditionCity;
  String expeditionState;
  String expeditionDate;
  String expirationDate;
  String fatherName;
  String motherName;
  String firstLicenseDate;
  String name;
  String rg;
  String code;
  String registrationNumber;
  String renach;
  String securityCode;
  String mirrorNumber;
  String observation;

  ResultOCR(Map<dynamic, dynamic> map){

    for(String nome in map.keys){

           if(nome == "BirthDate"){ birthDate = map[nome];}
      else if(nome == "PlaceOfBirth"){ placeOfBirth = map[nome];}
      else if(nome == "Category"){ category = map[nome];}
      else if(nome == "ExpeditionCity"){ expeditionCity = map[nome];}
      else if(nome == "ExpeditionState"){ expeditionState = map[nome];}
      else if(nome == "ExpeditionDate"){ expeditionDate = map[nome];}
      else if(nome == "ExpirationDate"){ expirationDate = map[nome];}
      else if(nome == "FatherName"){ fatherName = map[nome];}
      else if(nome == "MotherName"){ motherName = map[nome];}
      else if(nome == "FirstLicenseDate"){ firstLicenseDate = map[nome];}
      else if(nome == "Name"){ name = map[nome];}
      else if(nome == "RG"){ rg = map[nome];}
      else if(nome == "Code"){ code = map[nome];}
      else if(nome == "RegistrationNumber"){ registrationNumber = map[nome];}
      else if(nome == "Renach"){ renach = map[nome];}
      else if(nome == "SecurityCode"){ securityCode = map[nome];}
      else if(nome == "MirrorNumber"){ mirrorNumber = map[nome];}
      else if(nome == "Observation"){ observation = map[nome];}

    }

  }


}