
var kLocalJsonName = "unico-check-mobile-services"

class AcessoBioCamera: AcessoBioView, AcessoBioSelfieDelegate, SelfieCameraDelegate {
    
    override func callMethodBio(){
        switch SwiftUnicoCheckPlugin.methodCall {
        case MethodConstansts.openCamera: unicoCheck.build().prepareSelfieCamera(self, jsonConfigName: readLocalJsonFile(forName: kLocalJsonName), bundle: Bundle.main)
        default: SwiftUnicoCheckPlugin.result(FlutterMethodNotImplemented)
        }
    }
    
    func onCameraReady(_ cameraOpener: AcessoBioCameraOpenerDelegate!) {
        cameraOpener.open(self)
    }
    
    func onCameraFailed(_ message: ErrorPrepare!) {
        SwiftUnicoCheckPlugin.result(
            FlutterError(code: ReturnCostants.onError, message: "", details: ConvertToHashMap.convertObjToDicionary(result:message)))
    }

    func onSuccessSelfie(_ result: SelfieResult!) {
        SwiftUnicoCheckPlugin.result(ConvertToHashMap.convertObjToDicionary(result: result))
        
    }
    
    func onErrorSelfie(_ errorBio: ErrorBio!) {
        SwiftUnicoCheckPlugin.result(
            FlutterError(code: ReturnCostants.onError, message: "", details: ConvertToHashMap.convertObjToDicionary(result: errorBio))
        )
    }
    
    private func readLocalJsonFile(forName name: String) -> String? {
        do {
            if let fileName = Bundle.main.path(forResource: name, ofType: "json") {
                return fileName
            }
        }
        return nil
    }
}
