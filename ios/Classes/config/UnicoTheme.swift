//
//  UnicoTheme.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoTheme: NSObject, AcessoBioThemeDelegate {
    private var argument: Dictionary<String, Any>
    
    init(argument: Dictionary<String, Any>){
        self.argument = argument
    }
    
    func getColorBackground() -> Any? {
        return self.argument["colorBackground"] as? String ?? nil
    }
    
    func getColorBoxMessage() -> Any? {
        return self.argument["colorBoxMessage"] as? String ?? nil
    }
    
    func getColorTextMessage() -> Any? {
        return self.argument["colorTextMessage"] as? String ?? nil
    }
    
    func getColorBackgroundPopupError() -> Any? {
        return self.argument["colorBackgroundPopupError"] as? String ?? nil
    }
    
    func getColorTextPopupError() -> Any? {
        return self.argument["colorTextPopupError"] as? String ?? nil
    }
    
    func getColorBackgroundButtonPopupError() -> Any? {
        return self.argument["colorBackgroundButtonPopupError"] as? String ?? nil
    }
    
    func getColorTextButtonPopupError() -> Any? {
        return self.argument["colorTextButtonPopupError"] as? String ?? nil
    }
    
    func getColorBackgroundTakePictureButton() -> Any? {
        return self.argument["colorBackgroundTakePictureButton"] as? String ?? nil
    }
    
    func getColorIconTakePictureButton() -> Any? {
        return self.argument["colorIconTakePictureButton"] as? String ?? nil
    }
    
    func getColorBackgroundBottomDocument() -> Any? {
        return self.argument["colorBackgroundBottomDocument"] as? String ?? nil
    }
    
    func getColorTextBottomDocument() -> Any? {
        return self.argument["colorTextBottomDocument"] as? String ?? nil
    }
    
    func getColorSilhouetteSuccess() -> Any? {
        return self.argument["colorSilhouetteSuccess"] as? String ?? nil
    }
    
    func getColorSilhouetteError() -> Any? {
        return self.argument["colorSilhouetteError"] as? String ?? nil
    }
    
    func getColorSilhouetteNeutral() -> Any? {
        return self.argument["colorSilhouetteNeutral"] as? String ?? nil
    }
}

