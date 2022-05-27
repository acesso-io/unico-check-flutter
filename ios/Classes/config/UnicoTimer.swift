//
//  UnicoTimer.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class UnicoTimer {
    
    private let defaultTimeSession = 50.0
    private let timeoutSession: Double
    
    init(argument: Dictionary<String, Any>) {
        self.timeoutSession = argument[MethodConstants.SET_TIMEOUT_SESSION.rawValue] as? Double ?? defaultTimeSession
    }

    func getTimeoutSession() -> Double{
        return self.timeoutSession
    }
}
