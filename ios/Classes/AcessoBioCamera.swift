//
//  AcessoBioCamera.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

import Foundation

class AcessoBioCamera: AcessoBioView, AcessoBioSelfieDelegate, SelfieCameraDelegate {
    
    override func callMethodBio(){
        switch SwiftUnicoCheckPlugin.methodCall {
        case MethodConstants.OPEN_CAMERA_SELFIE.rawValue:
            unicoCheck.build()
                .prepareSelfieCamera(
                    self,
                    config: UnicoConfigFactory.make(argument: SwiftUnicoCheckPlugin.argument)
                )

        default:
            SwiftUnicoCheckPlugin.result(FlutterMethodNotImplemented)

        }
    }

    func onCameraReady(_ cameraOpener: AcessoBioCameraOpenerDelegate!) {
        cameraOpener.open(self)
    }
    
    func onCameraFailed(_ message: ErrorPrepare!) {
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
    
    func onSuccessSelfie(_ result: SelfieResult!) {
        SwiftUnicoCheckPlugin.result(ConvertToHashMap.successBioToHashMap(base64: result.base64, encrypted: result.encrypted))
        DispatchQueue.main.async {
            self.dismiss(animated: true)
            self.dismiss(animated: false)
        }
    }
    
    func onErrorSelfie(_ errorBio: ErrorBio!) {
        SwiftUnicoCheckPlugin.result(
            FlutterError(
                code: ReturnConstants.ON_ERROR_SELFIE.rawValue,
                message: ReturnConstants.ON_ERROR_SELFIE.rawValue,
                details: ConvertToHashMap.errorBioToHashMap(error: errorBio))
        )
        DispatchQueue.main.async {
            if let presentingViewController = self.presentingViewController {
                presentingViewController.dismiss(animated: false)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
