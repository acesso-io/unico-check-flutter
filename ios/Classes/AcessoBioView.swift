//
//  AcessoBioView.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 18/02/21.
//

import UIKit
import Flutter

class AcessoBioView: UIViewController, AcessoBioManagerDelegate {
    
    private var method: String!
    var unicoCheck: AcessoBioManager!
    private var isOpenCamera: Bool =  false
    private var acessoBioStatus = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUi()
        initAcessoBio()
        
        if(acessoBioStatus){ callMethodBio() }
    }
    
    func callMethodBio(){}
    
    override func viewWillAppear(_ animated: Bool) {
        if(isOpenCamera) {
            self.dismiss(animated: true, completion: nil)
        }
        isOpenCamera = true
    }
    
    private func setUi() {
        self.view.backgroundColor = UIColor(white: 1, alpha: 0.0)
        self.navigationController!.setToolbarHidden(true, animated: false)
    }
    
    private func initAcessoBio() {
        unicoCheck = AcessoBioManager(viewController: self)
        
        let cameraType = UnicoCameraType(argument: SwiftUnicoCheckPlugin.argument)
        let unicoTimer = UnicoTimer(argument: SwiftUnicoCheckPlugin.argument)
        
        unicoCheck.setSmartFrame(cameraType.getSmartFrame())
        unicoCheck.setAutoCapture(cameraType.getAutoCapture())
        unicoCheck.setTimeoutSession(unicoTimer.getTimeoutSession())
        unicoCheck.setTimeoutToFaceInference(unicoTimer.getTimeoutToFaceInference())
        unicoCheck.setTheme(UnicoTheme(argument: SwiftUnicoCheckPlugin.argument))
    }
    
    func onErrorAcessoBioManager(_ error: ErrorBio!) {
        acessoBioStatus = false
        SwiftUnicoCheckPlugin.result(
            FlutterError(code: ReturnCostants.onErrorAcessoBio, message: "", details: ConvertToHashMap.convertObjToDicionary(result: error))
        )
        self.dismiss(animated: true, completion: nil)
    }
    
    func onUserClosedCameraManually() {
        SwiftUnicoCheckPlugin.result(
            FlutterError(code: ReturnCostants.onUserClosedCameraManually, message: "", details: "")
        )
        self.dismiss(animated: true, completion: nil)
    }
    
    func onSystemClosedCameraTimeoutSession() {
        SwiftUnicoCheckPlugin.result(
            FlutterError(code: ReturnCostants.onSystemClosedCameraTimeoutSession, message: "", details: "")
        )
        self.dismiss(animated: true, completion: nil)
    }
    
    func onSystemChangedTypeCameraTimeoutFaceInference() {
        SwiftUnicoCheckPlugin.result(
            FlutterError(code: ReturnCostants.onSystemChangedTypeCameraTimeoutFaceInference, message: "", details: "")
        )
        self.dismiss(animated: true, completion: nil)
    }
}
