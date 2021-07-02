import Flutter
import UIKit

public class SwiftUnicoCheckPlugin: NSObject, FlutterPlugin {
    
    var result: FlutterResult!
    
    var urlIntance: String = ""
    var apikey: String = ""
    var authToken: String = ""
    
    var setIosColorSilhoutteNeutra: String? = nil
    var setIosColorSilhoutteSuccess: String? = nil
    var setIosColorSilhoutteError: String? = nil
    var setIosColorBackground: String? = nil
    var setIosColorBackgroundBoxStatus: String? = nil
    var setIosColorTextBoxStatus: String? = nil
    var setIosColorBackgroundPopupError: String? = nil
    var setIosColorTextPopupError: String? = nil
    var setIosImageIconPopupError: String? = nil
    var setTimeoutSession: Int = 0;
    var setTimeoutToFaceInference: Int = 0;
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "acessobio", binaryMessenger: registrar.messenger())
        let instance = SwiftUnicoCheckPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result
        
        let argument = call.arguments as? Dictionary<String, Any>
        if(argument == nil){
            self.result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
        
        getColors(call:call)
           
        switch call.method {
    
            case "openCameraDocument": openCameraDocument(
                method: call.method,
                DOCUMENT_TYPE: argument!["DOCUMENT_TYPE"] as? Int
            )
            
            case "openCamera": openCamera(
                method: call.method,
                disableAutoCapture: argument!["disableAutoCapture"]! as? Bool,
                disableSmartFrame: argument!["disableSmartFrame"]! as? Bool
            )
        
            default: result(FlutterMethodNotImplemented)
        }
        
    }
    
    private func createView(method: String, acessoBioView:AcessoBioView) -> AcessoBioView {
        
        acessoBioView.flutterResult = result
        acessoBioView.method = method
        
        acessoBioView.setColorSilhoutteNeutra = self.setIosColorSilhoutteNeutra
        acessoBioView.setColorSilhoutteSuccess = self.setIosColorSilhoutteSuccess
        acessoBioView.setColorSilhoutteError = self.setIosColorSilhoutteError
        acessoBioView.setColorBackground = self.setIosColorBackground
        acessoBioView.setColorBackgroundBoxStatus = self.setIosColorBackgroundBoxStatus
        acessoBioView.setColorTextBoxStatus = self.setIosColorTextBoxStatus
        acessoBioView.setColorBackgroundPopupError = self.setIosColorBackgroundPopupError
        acessoBioView.setColorTextPopupError = self.setIosColorTextPopupError
        acessoBioView.setImageIconPopupError = self.setIosImageIconPopupError
        
        return acessoBioView
    }
    
    private func initView(acessoBioView:AcessoBioView ){
        let nav = UINavigationController(rootViewController: acessoBioView)
        nav.setNavigationBarHidden(false, animated: false)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        let viewController: UIViewController = (UIApplication.shared.delegate?.window??.rootViewController)!;
        viewController.present(nav, animated: true, completion: nil)
    }
    
    private func getColors(call: FlutterMethodCall){
        
        let argument = call.arguments as? Dictionary<String, Any>
        
        setIosColorSilhoutteNeutra = argument!["setIosColorSilhoutteNeutra"] as? String
        setIosColorSilhoutteSuccess = argument!["setIosColorSilhoutteSuccess"] as? String
        setIosColorSilhoutteError = argument!["setIosColorSilhoutteError"] as? String
        setIosColorBackground = argument!["setIosColorBackground"] as? String
        setIosColorBackgroundBoxStatus = argument!["setIosColorBackgroundBoxStatus"] as? String
        setIosColorTextBoxStatus = argument!["setIosColorTextBoxStatus"] as? String
        setIosColorBackgroundPopupError = argument!["setIosColorBackgroundPopupError"] as? String
        setIosColorTextPopupError = argument!["setIosColorTextPopupError"] as? String
        setIosImageIconPopupError = argument!["setIosImageIconPopupError"] as? String
        
    }
    
    //Document
    private func openCameraDocument(method: String, DOCUMENT_TYPE : Int?){
        
        let acessoBioView = AcessoBioDocument()
        
        acessoBioView.valueExtra["DOCUMENT_TYPE"] = DOCUMENT_TYPE
        
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    
    //Camera
    private func getAcessoBioCamera(disableAutoCapture: Bool? ,disableSmartFrame: Bool?  ) -> AcessoBioCamera{
        
        let acessoBioView = AcessoBioCamera()
        
        if(disableAutoCapture != nil){
            acessoBioView.valueExtra["disableAutoCapture"] = disableAutoCapture
        }
        if(disableAutoCapture != nil){
            acessoBioView.valueExtra["disableSmartFrame"] = disableSmartFrame
        }

        return acessoBioView
    }
    
    private func openCamera(method: String, disableAutoCapture: Bool?, disableSmartFrame: Bool?){
        let acessoBioView = getAcessoBioCamera(disableAutoCapture: disableAutoCapture,disableSmartFrame: disableSmartFrame)
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    
    
}

        
