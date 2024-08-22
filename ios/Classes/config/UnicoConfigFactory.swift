//
//  UnicoConfigFactory.swift
//  Pods
//
//  Created by Lucas Diniz da Silva on 27/05/22.
//

import Foundation

private final class ClassicUnicoConfig: NSObject,  AcessoBioConfigDataSource {
    private var configurations: [String: Any]?

    init(configurations: [String: Any]?) {
        self.configurations = configurations
    }
    
    func getProjectNumber() -> String {
        return self.configurations?[MethodConstants.PROJECT_NUMBER.rawValue] as? String ?? ""
    }
    
    func getProjectId() -> String {
        return self.configurations?[MethodConstants.PROJECT_ID.rawValue] as? String ?? ""
    }
    
    func getMobileSdkAppId() -> String {
        return self.configurations?[MethodConstants.MOBILE_SDK_APP_ID.rawValue] as? String ?? ""
    }
    
    func getBundleIdentifier() -> String {
        return self.configurations?[MethodConstants.BUNDLE_IDENTIFIER.rawValue] as? String ?? ""
    }
    
    func getHostInfo() -> String {
        return self.configurations?[MethodConstants.HOST_INFO.rawValue] as? String ?? ""
    }
    
    func getHostKey() -> String {
        return self.configurations?[MethodConstants.HOST_KEY.rawValue] as? String ?? ""
    }
}

private final class PlatformUnicoConfig: NSObject,  AcessoBioConfigDataSource {
    private var configurations: [String: Any]?

    init(configurations: [String: Any]?) {
        self.configurations = configurations
    }

    func getBundleIdentifier() -> String {
        return self.configurations?[MethodConstants.BUNDLE_IDENTIFIER.rawValue] as? String ?? ""
    }

    func getHostKey() -> String {
        return self.configurations?[MethodConstants.HOST_KEY.rawValue] as? String ?? ""
    }
}

final class UnicoConfigFactory {
    class func make(argument: [String: Any]) -> AcessoBioConfigDataSource {
        let configurations = argument[MethodConstants.UNICO_CONFIG_IOS.rawValue] as? [String: Any]
        switch configurations?[MethodConstants.HOST_INFO.rawValue] as? String {
        case .some:
            return ClassicUnicoConfig(configurations: configurations)

        case .none:
            return PlatformUnicoConfig(configurations: configurations)

        }
    }
}
