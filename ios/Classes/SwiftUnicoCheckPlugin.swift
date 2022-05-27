import Flutter
import UIKit

public class SwiftUnicoCheckPlugin: NSObject, FlutterPlugin {
    
    static var methodCall: String!
    static var result: FlutterResult!
    static var argument: Dictionary<String, Any>!
    static var jsonFileName: String!
    static var channel: FlutterMethodChannel!
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        SwiftUnicoCheckPlugin.channel = FlutterMethodChannel(name: MethodConstants.BRIDGE_NAME.rawValue, binaryMessenger: registrar.messenger())
        let instance = SwiftUnicoCheckPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        SwiftUnicoCheckPlugin.result = result
        SwiftUnicoCheckPlugin.methodCall = call.method
        SwiftUnicoCheckPlugin.argument = call.arguments as? Dictionary<String, Any>
        
        getJsonFileName()
        selectCameraMethod()
    }
    
    private func selectCameraMethod(){
        
        switch SwiftUnicoCheckPlugin.methodCall {
            
        case MethodConstants.OPEN_CAMERA_SELFIE.rawValue: openCamera()
        case MethodConstants.OPEN_CAMERA_DOCUMENT.rawValue: openCameraDocument()
            
        default: SwiftUnicoCheckPlugin.result(FlutterMethodNotImplemented)
        }
    }
    
    private func getJsonFileName(){
        let json = SwiftUnicoCheckPlugin.argument[MethodConstants.JSON_NAME.rawValue] as? String
        if(json != nil || json != ""){
            SwiftUnicoCheckPlugin.jsonFileName = json
        }else{
            SwiftUnicoCheckPlugin.result(
                FlutterError(
                    code: ReturnConstants.ON_ERROR_JSON_FILE_NAME.rawValue,
                    message: ReturnConstants.ON_ERROR_JSON_FILE_NAME.rawValue,
                    details: nil)
            )
        }
    }
    
    private func openCameraDocument() {
        initView(acessoBioView: AcessoBioDocument())
    }
    
    private func openCamera() {
        initView(acessoBioView: AcessoBioCamera())
    }
    
    private func initView(acessoBioView:AcessoBioView ){
        let nav = UINavigationController(rootViewController: acessoBioView)
        nav.setNavigationBarHidden(true, animated: false)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        let viewController: UIViewController = (UIApplication.shared.delegate?.window??.rootViewController)!
        viewController.present(nav, animated: false, completion: nil)
    }
}
