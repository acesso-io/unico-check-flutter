//
//  UnicoConfig.swift
//  Pods
//
//  Created by Lucas Diniz da Silva on 27/05/22.
//

import Foundation


class UnicoConfig : NSObject,  AcessoBioConfigDataSource {
    private var argument: Dictionary<String, Any>?
    
    init(argument: Dictionary<String, Any>){
        self.argument = argument[MethodConstants.UNICO_CONFIG_IOS.rawValue] as? Dictionary<String, Any> ?? nil
    }
    
    func getProjectNumber() -> String {
        return self.argument?[MethodConstants.PROJECT_NUMBER.rawValue] as? String ?? ""
    }
    
    func getProjectId() -> String {
        return self.argument?[MethodConstants.PROJECT_ID.rawValue] as? String ?? ""
    }
    
    func getMobileSdkAppId() -> String {
        return self.argument?[MethodConstants.MOBILE_SDK_APP_ID.rawValue] as? String ?? ""
    }
    
    func getBundleIdentifier() -> String {
        return self.argument?[MethodConstants.BUNDLE_IDENTIFIER.rawValue] as? String ?? ""
    }
    
    func getHostInfo() -> String {
        return self.argument?[MethodConstants.HOST_INFO.rawValue] as? String ?? ""
    }
    
    func getHostKey() -> String {
        return self.argument?[MethodConstants.HOST_KEY.rawValue] as? String ?? ""
    }
}
