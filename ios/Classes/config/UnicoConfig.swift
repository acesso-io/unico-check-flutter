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
        self.argument = argument["unico_config_ios"] as? Dictionary<String, Any> ?? nil
    }
    
    func getProjectNumber() -> String {
        return self.argument?["project_number"] as? String ?? ""
    }
    
    func getProjectId() -> String {
        return self.argument?["project_id"] as? String ?? ""
    }
    
    func getMobileSdkAppId() -> String {
        return self.argument?["mobile_sdk_app_id"] as? String ?? ""
    }
    
    func getBundleIdentifier() -> String {
        return self.argument?["bundle_identifier"] as? String ?? ""
    }
    
    func getHostInfo() -> String {
        return self.argument?["host_info"] as? String ?? ""
    }
    
    func getHostKey() -> String {
        return self.argument?["host_Key"] as? String ?? ""
    }
}
