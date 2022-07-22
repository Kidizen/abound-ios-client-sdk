//
//  Utils.swift
//  Abound
//
//  Created by Abound on 7/8/22.
//

import Foundation

class Utils{
    static func toSize(value:String?, defaultValue:String) -> String{
        return toMatch(value: value,defaultValue: defaultValue, regex: "^[0-9]+(px)?$").replacingOccurrences(of: "px", with: "")+"px"
    }
    
    static func toFontFamily(value:String?, defaultValue:String) -> String{
        return toMatch(value: value,defaultValue: defaultValue, regex: "[a-zA-Z]")
    }
    
    static func toWeight(value:String?, defaultValue:String) -> String{
        return toMatch(value: value,defaultValue: defaultValue, regex: "(light)|(normal)|(bold)")
    }
    
    static func toColor(value:String?, defaultValue:String) -> String{
        return toMatch(value: value,defaultValue: defaultValue, regex: "#[0-9abcdef]{6}")
    }
    
    static func toMatch(value:String? , defaultValue: String, regex: String) -> String{
        let value = value ?? defaultValue
        let validatedValue = value.lowercased().matches(regex) ? value: defaultValue
        return validatedValue
    }
}


extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
