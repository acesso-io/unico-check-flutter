//
//  AcessoBioLiveness.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 22/02/21.
//

class AcessoBioLiveness: AcessoBioView {
    
    override func callMethodBio(){
        switch method {
            
            case "openLiveness": acessoBioManager.openLivenessX()
            case "openLivenessWithCreateProcess": openLivenessWithCreateProcess()
                
            default: flutterResult(FlutterMethodNotImplemented)
        }
    }
    
    func openLivenessWithCreateProcess(){
        
        let name = valueExtra["name"] as? String
        let document = valueExtra["document"] as? String
        
        if(name != nil && document != nil){
            acessoBioManager.openLivenessX(withCreateProcess: document!, name: name!)
        }else{
            onError(msg: "Informe dome e documento")
        }
        
    }
    
    
    func onSuccesLivenessX(_ result: LivenessXResult!) {
        flutterResult(convertObjToDicionary(result: result, status: 1))
    }
    
    func onErrorLivenessX(_ error: String!) {
        flutterResult(convertObjToDicionary(result: error, status: 0))
    }
    
    func onSuccesCameraFace(_ result: CameraFaceResult!) {
        flutterResult(convertObjToDicionary(result: result, status: 1))
    }
    
    func onErrorCameraFace(_ error: String!) {
        flutterResult(convertObjToDicionary(result: error, status: 0))
    }
    
    
    
    

}
