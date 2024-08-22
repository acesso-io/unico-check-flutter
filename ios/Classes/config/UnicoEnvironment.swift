//
//  UnicoEnvironment.swift
//  unico_check
//
//  Created by Bruno Corrêa on 22/08/24.
//

import Foundation

final class UnicoEnvironment {
    private let environment: EnvironmentEnum

    init(argument: Dictionary<String, Any>) {
        let rawEnvironment = argument[MethodConstants.SET_ENVIRONMENT.rawValue] as? String

        switch rawEnvironment {
        case .some("DEV"):
            self.environment = .DEV

        case .some("UAT"):
            self.environment = .UAT

        case .some("PROD"), .none, .some(_):
            self.environment = .PROD

        }
    }

    func getEnvironment() -> EnvironmentEnum {
        return environment
    }
}
