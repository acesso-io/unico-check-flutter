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
        return self.argument["iosColorBackground"] as? String ?? nil
    }
    
    func getColorBoxMessage() -> Any? {
        return self.argument["iosColorBoxMessage"] as? String ?? nil
    }
    
    func getColorTextMessage() -> Any? {
        return self.argument["iosColorTextMessage"] as? String ?? nil
    }
    
    func getColorBackgroundPopupError() -> Any? {
        return self.argument["iosColorBackgroundPopupError"] as? String ?? nil
    }
    
    func getColorTextPopupError() -> Any? {
        return self.argument["iosColorTextPopupError"] as? String ?? nil
    }
    
    func getColorBackgroundButtonPopupError() -> Any? {
        return self.argument["iosColorBackgroundButtonPopupError"] as? String ?? nil
    }
    
    func getColorTextButtonPopupError() -> Any? {
        return self.argument["iosColorTextButtonPopupError"] as? String ?? nil
    }
    
    func getColorBackgroundTakePictureButton() -> Any? {
        return self.argument["iosColorBackgroundTakePictureButton"] as? String ?? nil
    }
    
    func getColorIconTakePictureButton() -> Any? {
        return self.argument["iosColorIconTakePictureButton"] as? String ?? nil
    }
    
    func getColorBackgroundBottomDocument() -> Any? {
        return self.argument["iosColorBackgroundBottomDocument"] as? String ?? nil
    }
    
    func getColorTextBottomDocument() -> Any? {
        return self.argument["iosColorTextBottomDocument"] as? String ?? nil
    }
    
    func getColorSilhouetteSuccess() -> Any? {
        return self.argument["iosColorSilhouetteSuccess"] as? String ?? nil
    }
    
    func getColorSilhouetteError() -> Any? {
        return self.argument["iosColorSilhouetteError"] as? String ?? nil
    }
}

