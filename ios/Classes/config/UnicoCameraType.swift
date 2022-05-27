//
//  UnicoCameraType.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoCameraType {
    
    private var autoCapture: Bool = true
    private var smartFrame: Bool = true
    
    init(argument: Dictionary<String, Any>) {
        self.autoCapture = argument[MethodConstants.AUTO_CAPTURE.rawValue] as? Bool ?? true
        self.smartFrame = argument[MethodConstants.SMART_FRAME.rawValue] as? Bool ?? true
    }

    func getAutoCapture() -> Bool {
        return self.autoCapture
    }

    func getSmartFrame() -> Bool{
        return self.smartFrame
    }
}
