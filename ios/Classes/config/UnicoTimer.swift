//
//  UnicoTimer.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoTimer {
    
    private var timeoutSession: Double = 50.0
    private var timeoutToFaceInference: Double = 15.0
    
    init(argument: Dictionary<String, Any>) {
        self.timeoutSession = argument[MethodConstansts.setTimeoutSession] as! Double
        self.timeoutToFaceInference = argument[MethodConstansts.setTimeoutToFaceInference] as! Double
    }

    func getTimeoutSession() -> Double{
        return self.timeoutSession
    }

    func getTimeoutToFaceInference() -> Double {
        return self.timeoutToFaceInference
    }
}
