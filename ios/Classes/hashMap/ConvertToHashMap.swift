//
//  ConvertToHashMap.swift
//  Pods
//
//  Created by Lucas Diniz Silva on 26/08/21.
//

import Foundation

class ConvertToHashMap {
    
    static func convertObjToDicionary(result : NSObject) -> [String:Any] {
        
        let obj: AnyClass = result.classForCoder
        var outCount : UInt32 = 0
        let properties = class_copyPropertyList(obj, &outCount)
        var dict = [String:Any]()
        
        for i in 0 ..< Int(outCount) {
            
            let property = properties?[i],

            strKey = NSString(utf8String: property_getName(property!)) as String?

            let attrs = result.value(forKey: strKey!)
            
            if(attrs != nil){
                dict[strKey!] = attrs
            }else{
                dict[strKey!] = ""
            }
              
        }
        
        return dict
    }
    
    static func convertObjToDicionary(result : String) -> [String:Any] {
        
        var dict = [String:Any]()
        dict["result"] = result
        
        return dict
    }
    
    static func convertObjToDicionary(result : Int) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["result"] = result
        
        return dict
    }
}
