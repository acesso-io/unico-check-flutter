//
//  UnicoTimer.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoTimer {
    
    private let defaultTimeSession = 50.0
    private let defaultTimeFaceInference = 15.0
    private let timeoutSession: Double
    private let timeoutToFaceInference: Double
    
    init(argument: Dictionary<String, Any>) {
        self.timeoutSession = argument[MethodConstansts.setTimeoutSession] as? Double ?? defaultTimeSession
        self.timeoutToFaceInference = argument[MethodConstansts.setTimeoutToFaceInference] as? Double ?? defaultTimeFaceInference
    }

    func getTimeoutSession() -> Double{
        return self.timeoutSession
    }

    func getTimeoutToFaceInference() -> Double {
        return self.timeoutToFaceInference
    }
}
