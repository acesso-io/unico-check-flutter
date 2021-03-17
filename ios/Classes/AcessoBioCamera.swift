//
//  AcessoBioCamera.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioCamera: AcessoBioView {
    
    override func callMethodBio(){
        switch method {
            
            case "openCamera": acessoBioManager.openCameraFace()
            case "openCameraWithCreateProcess": openCameraFaceWithCreateProcess()
            
                
            default: flutterResult(FlutterMethodNotImplemented)
        }
    }
    
    func openCameraFaceWithCreateProcess(){
        
        let nome = valueExtra["nome"] as? String
        let code = valueExtra["code"] as? String
        let gender = valueExtra["gender"] as? String
        let birthdate = valueExtra["birthdate"] as? String
        let email = valueExtra["email"] as? String
        let phone = valueExtra["phone"] as? String

        if(
                nome != nil && nome != ""
                && code != nil && code != ""
                && gender != nil && gender != ""
                && birthdate != nil && birthdate != ""
                && email != nil && email != ""
                && phone != nil && phone != ""
        ){
            acessoBioManager.openCameraFace(withCreateProcess: nome, name: nome,gender: gender,birthdate: birthdate,email: email,phone: phone)
        }else if(nome != nil && nome != "" && code != nil && code != ""){
            acessoBioManager.openCameraFace(withCreateProcess: nome,name: code)
        }else{
            onError(msg: "ao menos nome e code sao obrigatorios")
        }
    
    }
    
    func onSuccesCameraFace(_ result: CameraFaceResult!){
        flutterResult(convertObjToDicionary(result: result, status: 1))
    }
    
    func onErrorCameraFace(_ error: String!){
        flutterResult(convertObjToDicionary(result: error, status: 0))
    }
    
 
    
    

}
