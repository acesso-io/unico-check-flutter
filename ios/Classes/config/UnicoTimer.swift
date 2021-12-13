//
//  UnicoTimer.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoTimer {
    
    private var timeoutSession: Double
    private var timeoutToFaceInference: Double
    
    init(argument: Dictionary<String, Any>) {
        self.timeoutSession = argument[MethodConstansts.setTimeoutSession] as? Double ?? 50.0
        self.timeoutToFaceInference = argument[MethodConstansts.setTimeoutToFaceInference] as? Double ?? 15.0
    }

    func getTimeoutSession() -> Double{
        return self.timeoutSession
    }

    func getTimeoutToFaceInference() -> Double {
        return self.timeoutToFaceInference
    }
}
