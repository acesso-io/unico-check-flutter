//
//  AcessoBioView.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 18/02/21.
//

import UIKit
import Flutter

class AcessoBioView: UIViewController, AcessoBioManagerDelegate {
    
    var method: String!
    var unicoCheck: AcessoBioManager!
    var flutterResult: FlutterResult!
    var unicoTheme: UnicoTheme!
    var unicoTimer: UnicoTimer!
    var unicoCameraType: UnicoCameraType!

    var isOpenCamera: Bool =  false
    var acecessoBioStatus = true
    
    var valueExtra = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUi()
        initAcessoBio()
        
        if(acecessoBioStatus){ callMethodBio() }
    }
    
    func callMethodBio(){}
    
    override func viewWillAppear(_ animated: Bool) {
        if(isOpenCamera){
            self.dismiss(animated: true, completion: nil)
        }
        isOpenCamera = true
    }
    
    private func setUi(){
        self.view.backgroundColor = UIColor(white: 1, alpha: 0.0)
        self.navigationController!.setToolbarHidden(true, animated: false)
    }
    
    private func initAcessoBio(){
        unicoCheck = AcessoBioManager(viewController: self)
        unicoCheck.setSmartFrame(unicoCameraType.smartFrame)
        unicoCheck.setAutoCapture(unicoCameraType.autoCapture)
        unicoCheck.setTimeoutSession(unicoTimer.timeoutSession)
        unicoCheck.setTimeoutToFaceInference(unicoTimer.timeoutToFaceInference)
        unicoCheck.setTheme(unicoTheme)
//        unicoCheck.setLanguageOrigin(LanguageOrigin.Flutter, release: "2.0.0-beta.3")
    }
    
    func onErrorAcessoBioManager(_ error: ErrorBio!) {
        acecessoBioStatus = false
        flutterResult(
            FlutterError(code: ReturnCostants.onErrorAcessoBio, message: "", details: ConvertToHashMap.convertObjToDicionary(result: error))
        )
        self.dismiss(animated: true, completion: nil)
    }
    
    func onUserClosedCameraManually() {
        flutterResult(
            FlutterError(code: ReturnCostants.onUserClosedCameraManually, message: "", details: "")
        )
        self.dismiss(animated: true, completion: nil)
    }
    
    func onSystemClosedCameraTimeoutSession() {
        flutterResult(
            FlutterError(code: ReturnCostants.onSystemClosedCameraTimeoutSession, message: "", details: "")
        )
        self.dismiss(animated: true, completion: nil)
    }
    
    func onSystemChangedTypeCameraTimeoutFaceInference() {
        flutterResult(
            FlutterError(code: ReturnCostants.onSystemChangedTypeCameraTimeoutFaceInference, message: "", details: "")
        )
        self.dismiss(animated: true, completion: nil)
    }
    
}
