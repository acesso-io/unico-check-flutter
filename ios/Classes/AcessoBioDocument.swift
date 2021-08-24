//
//  AcessoBioDocument.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioDocument: AcessoBioView, AcessoBioDocumentDelegate, DocumentCameraDelegate{
    
    var document: DocumentEnums = DocumentEnums.none
    
    override func callMethodBio(){
        selectDocument()
        switch method {
            
            case MethodConstansts.openCameraDocument: unicoCheck.build().prepareDocumentCamera(self)
                
            default: flutterResult(FlutterMethodNotImplemented)
        }
    }
    
    func onCameraReadyDocument(_ cameraOpener: AcessoBioCameraOpenerDelegate!) {
        cameraOpener.openDocument(
            document,
            delegate: self
        )
    }
    
    func onCameraFailedDocument(_ message: String!) { }
    
    func selectDocument(){
        let document_type = valueExtra["DOCUMENT_TYPE"] as? Int
        
        switch document_type {
            case 501: do { document = DocumentEnums.rgFrente }
            case 502: do { document = DocumentEnums.rgVerso }
            case 4: do { document = DocumentEnums.CNH }
                
            default: document = DocumentEnums.none
        }
    }

    func onSuccessDocument(_ result: DocumentResult!) {
        flutterResult(ConvertToHashMap.convertObjToDicionary(result: result))
    }
    
    func onErrorDocument(_ errorBio: ErrorBio!) {
        flutterResult(
            FlutterError(code: ReturnCostants.onError, message: "", details: ConvertToHashMap.convertObjToDicionary(result: errorBio))
        )
    }
}
