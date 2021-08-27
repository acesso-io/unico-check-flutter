import Flutter
import UIKit

public class SwiftUnicoCheckPlugin: NSObject, FlutterPlugin {
    
    static let BRIDGE_NAME = "acessobio"
    static var methodCall: String!
    static var result: FlutterResult!
    static var argument: Dictionary<String, Any>!

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: BRIDGE_NAME, binaryMessenger: registrar.messenger())
        let instance = SwiftUnicoCheckPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        SwiftUnicoCheckPlugin.result = result
        SwiftUnicoCheckPlugin.methodCall = call.method
        SwiftUnicoCheckPlugin.argument = call.arguments as? Dictionary<String, Any>
       
        selectCameraMethod()
    }
    
    private func selectCameraMethod(){
        
        switch SwiftUnicoCheckPlugin.methodCall {
    
            case MethodConstansts.openCamera: openCamera()
            case MethodConstansts.openCameraDocument: openCameraDocument()
            
            default: SwiftUnicoCheckPlugin.result(FlutterMethodNotImplemented)
        }
    }
    
    private func openCameraDocument() {
        initView(acessoBioView: AcessoBioDocument())
    }
    
    private func openCamera() {
        initView(acessoBioView: AcessoBioCamera() )
    }
    
    private func initView(acessoBioView:AcessoBioView ){
        let nav = UINavigationController(rootViewController: acessoBioView)
        nav.setNavigationBarHidden(true, animated: false)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        let viewController: UIViewController = (UIApplication.shared.delegate?.window??.rootViewController)!
        viewController.present(nav, animated: false, completion: nil)
    }
}

        
