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
        
        validKeys(
            urlIntance: argument!["urlIntance"] as? String,
            apikey: argument!["apikey"] as? String,
            authToken: argument!["authToken"] as? String
        )
        getColors(call:call)
           
        switch call.method {
    
                    
            //Document
            case "openCameraDocumentOCR": openCameraDocumentOCR(method: call.method,DOCUMENT_TYPE: argument!["DOCUMENT_TYPE"] as? Int)
            case "openFaceMatch": openCameraDocumentOCR(method: call.method,DOCUMENT_TYPE: argument!["DOCUMENT_TYPE"] as? Int)
            case "openCameraDocument": openCameraDocumentOCR(method: call.method,DOCUMENT_TYPE: argument!["DOCUMENT_TYPE"] as? Int)
            case "openCameraInsertDocument": result(FlutterMethodNotImplemented)

            //Auth
            case "openAuthenticate": openAuthenticate(method: call.method, code: argument!["code"] as? String )

            //Camera
            case "openCamera": openCamera(
                method: call.method,
                disableAutoCapture: argument!["disableAutoCapture"]! as? Bool,
                disableSmartFrame: argument!["disableSmartFrame"]! as? Bool
            )
            case "openCameraWithCreateProcess": openCamera(
                method: call.method,
                nome: argument!["nome"]! as? String,
                code: argument!["code"]! as? String,
                gender: argument!["gender"]! as? String,
                birthdate: argument!["birthdate"]! as? String,
                email: argument!["email"]! as? String,
                phone: argument!["phone"]! as? String,
                disableAutoCapture: argument?["disableAutoCapture"] as? Bool,
                disableSmartFrame: argument?["disableSmartFrame"] as? Bool
            )
                    
            default: result(FlutterMethodNotImplemented)
        }
        
    }
    
    private func createView(method: String, acessoBioView:AcessoBioView) -> AcessoBioView {
        
        acessoBioView.flutterResult = result
        acessoBioView.method = method
        
        acessoBioView.urlIntance = self.urlIntance
        acessoBioView.apikey = self.apikey
        acessoBioView.authToken = self.authToken
        
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
    private func validKeys(urlIntance: String?, apikey: String?, authToken: String?){
            
        if(urlIntance != nil && urlIntance != "" ){
            self.urlIntance = urlIntance!
        }else{self.result(FlutterError.init(code: "bad args urlIntance", message: nil, details: nil))}
            
        if(apikey != nil && apikey != "" ){
            self.apikey = apikey!
        }else{self.result(FlutterError.init(code: "bad args apikey", message: nil, details: nil))}
           
        if(authToken != nil && authToken != "" ){
            self.authToken = authToken!
        }else{self.result(FlutterError.init(code: "bad args authToken", message: nil, details: nil))}
        
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
    private func openCameraDocumentOCR(method: String, DOCUMENT_TYPE : Int?){
        
        let acessoBioView = AcessoBioDocument()
        
        acessoBioView.valueExtra["DOCUMENT_TYPE"] = DOCUMENT_TYPE
        
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    
    //Auth
    private func openAuthenticate(method: String, code: String?){
        let acessoBioView = AcessoBioAuthenticate()
        
        acessoBioView.valueExtra["code"] = code
        
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
    
    private func openCamera(
        method: String,
        nome: String?,
        code: String?,
        gender: String?,
        birthdate: String?,
        email: String?,
        phone: String?,
        disableAutoCapture: Bool?,
        disableSmartFrame: Bool?
    ){
        
        let acessoBioView = getAcessoBioCamera(disableAutoCapture: disableAutoCapture,disableSmartFrame: disableSmartFrame)
        
        acessoBioView.valueExtra["nome"] = nome
        acessoBioView.valueExtra["code"] = code
        acessoBioView.valueExtra["gender"] = gender
        acessoBioView.valueExtra["birthdate"] = birthdate
        acessoBioView.valueExtra["email"] = email
        acessoBioView.valueExtra["phone"] = phone
        
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    
}

        
