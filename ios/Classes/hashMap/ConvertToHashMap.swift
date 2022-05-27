//
//  ConvertToHashMap.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class ConvertToHashMap {
    
    static func errorBioToHashMap(error : ErrorBio) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["status"] = false
        dict["code"] = error.code
        dict["description"] = error.desc
        
        return dict
    }
    
    static func successBioToHashMap(base64 : String, encrypted : String) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["status"] = true
        dict["base64"] = base64
        dict["encrypted"] = encrypted
        
        return dict
    }
    
    static func errorNotifier(errorMethodName : String) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["status"] = false
        dict["errorMethodName"] = errorMethodName
        
        return dict
    }
}
