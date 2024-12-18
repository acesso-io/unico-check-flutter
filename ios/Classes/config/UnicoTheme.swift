//
//  UnicoTheme.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoTheme: NSObject, AcessoBioThemeDelegate {
    private var argument: Dictionary<String, Any>?
    
    init(argument: Dictionary<String, Any>){
        self.argument = argument[MethodConstants.UNICO_THEME.rawValue] as? Dictionary<String, Any>
    }
    
    func getColorBackground() -> Any? {
        return self.argument?["colorBackground"] as? String
    }
    
    func getColorBoxMessage() -> Any? {
        return self.argument?["colorBoxMessage"] as? String
    }
    
    func getColorTextMessage() -> Any? {
        return self.argument?["colorTextMessage"] as? String
    }
    
    func getColorBackgroundPopupError() -> Any? {
        return self.argument?["colorBackgroundPopupError"] as? String
    }
    
    func getColorTextPopupError() -> Any? {
        return self.argument?["colorTextPopupError"] as? String
    }
    
    func getColorBackgroundButtonPopupError() -> Any? {
        return self.argument?["colorBackgroundButtonPopupError"] as? String
    }
    
    func getColorTextButtonPopupError() -> Any? {
        return self.argument?["colorTextButtonPopupError"] as? String
    }
    
    func getColorBackgroundTakePictureButton() -> Any? {
        return self.argument?["colorBackgroundTakePictureButton"] as? String
    }
    
    func getColorIconTakePictureButton() -> Any? {
        return self.argument?["colorIconTakePictureButton"] as? String
    }
    
    func getColorBackgroundBottomDocument() -> Any? {
        return self.argument?["colorBackgroundBottomDocument"] as? String
    }
    
    func getColorTextBottomDocument() -> Any? {
        return self.argument?["colorTextBottomDocument"] as? String
    }
    
    func getColorSilhouetteSuccess() -> Any? {
        return self.argument?["colorSilhouetteSuccess"] as? String
    }
    
    func getColorSilhouetteError() -> Any? {
        return self.argument?["colorSilhouetteError"] as? String
    }
    
    func getColorSilhouetteNeutral() -> Any? {
        return self.argument?["colorSilhouetteNeutral"] as? String
    }

    func getProgressBarColor() -> Any? {
        return self.argument?["colorProgressBar"] as? String
    }

    func getCancelButtonIconColor() -> Any? {
        return self.argument?["colorCancelButtonIcon"] as? String
    }
}

