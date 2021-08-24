import Flutter
import UIKit

public class SwiftUnicoCheckPlugin: NSObject, FlutterPlugin {
    
    var result: FlutterResult!
    var unicoTheme: UnicoTheme!
    var unicoTimer: UnicoTimer!
    var unicoCameraType: UnicoCameraType!
    
    var disableAutoCapture: Bool = true
    var disableSmartFrame: Bool = true

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "acessobio", binaryMessenger: registrar.messenger())
        let instance = SwiftUnicoCheckPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        self.result = result
        let argument = call.arguments as! Dictionary<String, Any>
        
        setTheme(argument: argument)
        setTimer(argument: argument)
        setCameraType(argument: argument)
        selectCameraMethod(methodCall: call.method,argument: argument)
    }
    
    private func selectCameraMethod(methodCall: String, argument: Dictionary<String, Any> ){
        
        switch methodCall {
    
            case MethodConstansts.openCamera: openCamera(
                method: methodCall
            )
    
            case MethodConstansts.openCameraDocument: openCameraDocument(
                method: methodCall,
                DOCUMENT_TYPE: argument[MethodConstansts.document_type] as? Int
            )
            
            default: result(FlutterMethodNotImplemented)
        }
    }
    
    private func setTheme(argument: Dictionary<String, Any>){
        self.unicoTheme = UnicoTheme(argument: argument)
    }
    
    private func setTimer(argument: Dictionary<String, Any>){
        unicoTimer = UnicoTimer(argument: argument)
    }
    
    private func setCameraType(argument: Dictionary<String, Any>){
        unicoCameraType = UnicoCameraType(argument: argument)
    }
    
    private func openCameraDocument(method: String, DOCUMENT_TYPE : Int?){
        
        let acessoBioView = AcessoBioDocument()
        acessoBioView.valueExtra[MethodConstansts.document_type] = DOCUMENT_TYPE
        
        initView(acessoBioView: createView(method: method, acessoBioView: acessoBioView))
    }
    
    private func openCamera(method: String){
        
        initView(
            acessoBioView:
                createView(
                    method: method,
                    acessoBioView: AcessoBioCamera()
            )
        )
    }
    
    private func createView(method: String, acessoBioView:AcessoBioView) -> AcessoBioView {
        
        acessoBioView.method = method
        acessoBioView.flutterResult = result
        acessoBioView.unicoTheme = unicoTheme
        acessoBioView.unicoTimer = unicoTimer
        acessoBioView.unicoCameraType = unicoCameraType
        
        return acessoBioView
    }
    
    private func initView(acessoBioView:AcessoBioView ){
        let nav = UINavigationController(rootViewController: acessoBioView)
        nav.setNavigationBarHidden(true, animated: false)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        let viewController: UIViewController = (UIApplication.shared.delegate?.window??.rootViewController)!;
        viewController.present(nav, animated: false, completion: nil)
    }
}

        
