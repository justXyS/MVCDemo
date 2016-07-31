//
//  TTModel.swift
//  MVCDemo-swift
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

import Foundation

protocol TTModel{
    func give<T: TTView>(view: T) -> Bool
    
}

extension TTModel {
    func give<T: TTView>(view: T) -> Bool{
        
        return view .update(self)
    }
}

extension TTModel where Self: NSObject{

    
    func parse(dic: Dictionary<String,AnyObject>) {
        parse(dic, c: Self.self)
    }
    
    private func parse(dic: Dictionary<String,AnyObject>,c: AnyClass) {
        var outCount:UInt32 = 0
        
        let properties = class_copyPropertyList(c.self, &outCount)
        
        for i in 0 ..< outCount {
            let property = properties[Int(i)]
            setField(property, dic: dic)
        }
    }
    
    //FIXME:不支持基本类型（Int）
    private func setField(property: objc_property_t,dic: Dictionary<String,AnyObject>){
        let name = property_getName(property)
        let sname = String(UTF8String:name)!
        
        guard let value = dic[sname] else {
            return
        }
        
        let type = property_getAttributes(property)
        
        let stype = String(UTF8String:type)
        
        let arr =  stype?.componentsSeparatedByString("\"")
        
        guard arr?.count > 1 else {
            return
        }
        
        let t: String = arr![1]
        
        let c:AnyClass = NSClassFromString(t)!
        
        if !value.isKindOfClass(c) {
            if value.isKindOfClass(NSNumber) && c.isSubclassOfClass(NSString) {
                let v = value as! NSNumber
                let vv = v.stringValue
                setValue(vv, forKey: sname)
            } else if value.isKindOfClass(NSString) && c.isSubclassOfClass(NSNumber) {
                let v = value as! NSString
                let vv = NSNumber.init(longLong: v.longLongValue)
                setValue(vv, forKey: sname)
            } else if value.isKindOfClass(NSDictionary) && c.self is TTModel {
                let v = value as! NSDictionary
                parse(v as! Dictionary<String, AnyObject>, c: c)
            }
        } else {
            setValue(value, forKey: sname)
        }
    }
}
