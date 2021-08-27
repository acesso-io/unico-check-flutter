//
//  AcessoBioDocument.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioDocument: AcessoBioView, AcessoBioDocumentDelegate, DocumentCameraDelegate{
    
    static let rgFrente = 501
    static let rgVerso = 502
    static let CNH = 4
    var document: DocumentEnums = DocumentEnums.none
    
    override func callMethodBio(){
        selectDocument()
        switch SwiftUnicoCheckPlugin.methodCall {
            
            case MethodConstansts.openCameraDocument: unicoCheck.build().prepareDocumentCamera(self)
                
            default: SwiftUnicoCheckPlugin.result(FlutterMethodNotImplemented)
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
        let document_type = SwiftUnicoCheckPlugin.argument[MethodConstansts.document_type] as? Int
        
        switch document_type {
            case AcessoBioDocument.rgFrente: do { document = DocumentEnums.rgFrente }
            case AcessoBioDocument.rgVerso: do { document = DocumentEnums.rgVerso }
            case AcessoBioDocument.CNH: do { document = DocumentEnums.CNH }
                
            default: document = DocumentEnums.none
        }
    }

    func onSuccessDocument(_ result: DocumentResult!) {
        SwiftUnicoCheckPlugin.result(ConvertToHashMap.convertObjToDicionary(result: result))
    }
    
    func onErrorDocument(_ errorBio: ErrorBio!) {
        SwiftUnicoCheckPlugin.result(
            FlutterError(code: ReturnCostants.onError, message: "", details: ConvertToHashMap.convertObjToDicionary(result: errorBio))
        )
    }
}
