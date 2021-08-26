//
//  UnicoCameraType.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoCameraType {
    
    var autoCapture: Bool = true
    var smartFrame: Bool = true
    
    init(argument: Dictionary<String, Any>) {
        self.autoCapture = argument[MethodConstansts.disableAutoCapture] as? Bool ?? true
        self.smartFrame = argument[MethodConstansts.disableSmartFrame] as? Bool ?? true
    }
}
