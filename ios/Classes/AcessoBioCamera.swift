//
//  AcessoBioCamera.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioCamera: AcessoBioView {
    
    override func callMethodBio(){
        cameraSetings()
        switch method {
            
            case "openCamera": acessoBioManager.openCameraFace()
            
                
            default: flutterResult(FlutterMethodNotImplemented)
                
        }
    }
    
    func cameraSetings(){
        let disableAutoCapture = valueExtra["disableAutoCapture"] as? Bool
        let disableSmartFrame = valueExtra["disableSmartFrame"] as? Bool
        
        if( disableAutoCapture != nil && disableAutoCapture == true){
            acessoBioManager.disableAutoCapture()
        }
        if(disableAutoCapture != nil && disableSmartFrame == true){
            acessoBioManager.disableSmartCamera()
        }
    }

    
    func onSuccesCameraFace(_ result: CameraFaceResult!){
        flutterResult(convertObjToDicionary(result: result, status: 1))
    }
    
    func onErrorCameraFace(_ error: String!){
        flutterResult(convertObjToDicionary(result: error, status: 0))
    }
    

}
