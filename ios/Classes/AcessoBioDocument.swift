//
//  AcessoBioDocument.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioDocument: AcessoBioView, AcessoBioDocumentDelegate, DocumentCameraDelegate{
    
    static let RG_FRENTE = "RG_FRENTE"
    static let RG_VERSO = "RG_VERSO"
    static let CNH = "CNH"
    static let CNH_FRENTE = "CNH_FRENTE"
    static let CNH_VERSO = "CNH_VERSO"
    static let CPF = "CPF"
    static let NONE = "NONE"
    
    var document: DocumentEnums = DocumentEnums.none
    
    override func callMethodBio(){
        selectDocument()
        switch SwiftUnicoCheckPlugin.methodCall {
        case MethodConstants.OPEN_CAMERA_DOCUMENT.rawValue: 
            unicoCheck.build()
                .prepareDocumentCamera(
                    self,
                    config: UnicoConfigFactory.make(argument: SwiftUnicoCheckPlugin.argument)
                )

        default: 
            SwiftUnicoCheckPlugin.result(FlutterMethodNotImplemented)

        }
    }
    
    func onCameraReadyDocument(_ cameraOpener: AcessoBioCameraOpenerDelegate!) {
        cameraOpener.openDocument(
            document,
            delegate: self
        )
    }
    
    func onCameraFailedDocument(_ message: ErrorPrepare!) {
        SwiftUnicoCheckPlugin.result(
            FlutterError(
                code: ReturnConstants.ON_CAMERA_FAILED_PREPARE.rawValue,
                message: ReturnConstants.ON_CAMERA_FAILED_PREPARE.rawValue,
                details: ConvertToHashMap.errorBioToHashMap(error: ErrorBio(
                    code: Int(ReturnConstants.ON_CAMERA_FAILED_PREPARE.rawValue) ?? 101,
                    method: "",
                    desc: message.desc
                ))
            )
        )
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func selectDocument(){
        let document_type = SwiftUnicoCheckPlugin.argument[MethodConstants.DOCUMENT_TYPE.rawValue] as? String
        
        switch document_type {
        case AcessoBioDocument.RG_FRENTE : do { document = DocumentEnums.rgFrente }
        case AcessoBioDocument.RG_VERSO: do { document = DocumentEnums.rgVerso }
        case AcessoBioDocument.CNH: do { document = DocumentEnums.CNH }
        case AcessoBioDocument.CNH_FRENTE: do { document = DocumentEnums.cnhFrente }
        case AcessoBioDocument.CNH_VERSO: do { document = DocumentEnums.cnhVerso}
        case AcessoBioDocument.CPF: do { document = DocumentEnums.CPF }
        case AcessoBioDocument.NONE: do { document = DocumentEnums.none }
        default: document = DocumentEnums.none
            
        }
    }
    
    
    func onSuccessDocument(_ result: DocumentResult!) {
        SwiftUnicoCheckPlugin.result(ConvertToHashMap.successBioToHashMap(base64: result.base64, encrypted: result.encrypted))
        DispatchQueue.main.async {
            self.dismiss(animated: true)
            self.dismiss(animated: false)
        }
    }
    
    func onErrorDocument(_ errorBio: ErrorBio!) {
        SwiftUnicoCheckPlugin.result(
            FlutterError(
                code: ReturnConstants.ON_ERROR_DOCUMENT.rawValue,
                message: ReturnConstants.ON_ERROR_DOCUMENT.rawValue,
                details: ConvertToHashMap.errorBioToHashMap(error: errorBio))
        )
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
