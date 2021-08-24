//
//  UnicoTimer.swift
//  unico_check
//
//  Created by Lucas Diniz Silva on 23/08/21.
//

import Foundation

class UnicoTimer {
    
    var timeoutSession: Double = 50.0
    var timeoutToFaceInference: Double = 15.0
    
    init(argument: Dictionary<String, Any>) {
        self.timeoutSession = argument[MethodConstansts.setTimeoutSession] as! Double
        self.timeoutToFaceInference = argument[MethodConstansts.setTimeoutToFaceInference] as! Double
    }
    
}
