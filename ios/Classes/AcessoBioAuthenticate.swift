//
//  AcessoBioCamera.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioAuthenticate: AcessoBioView {
 
    
    override func callMethodBio(){
        switch method {
            
            case "openAuthenticate": openAuthenticate()
            
                
            default: flutterResult(FlutterMethodNotImplemented)
        }
        
    }
    
    private func openAuthenticate(){
        
        let code = valueExtra["code"] as? String
        
        if(code != nil){
            acessoBioManager.facesCompare(code)
        }else{
            onError(msg: "informe o CPF")
        }
        
    }
    
    func onSuccessFacesCompare(_ result: Bool){
        flutterResult(convertObjToDicionary(result: result, status: 1))
    }
    
    func onErrorFacesCompare(_ error: String!){
        flutterResult(convertObjToDicionary(result: error, status: 0))
    }

    
    
}
