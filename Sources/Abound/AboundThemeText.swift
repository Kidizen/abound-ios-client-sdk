//
//  AboundThemeText.swift
//  Abound
//
//  Created by Abound on 7/6/22.
//

import Foundation

public class AboundThemeText{
    var componentLabelSize: String
    var componentSize: String
    var fontFamily: String
    var size: String
    var weight: String
    
    public init(componentLabelSize: String = "14px",
         componentSize: String = "14px",
         fontFamily: String = "Arial",
         size: String = "12px",
         weight: String = "normal"
    ){
        self.componentLabelSize = Utils.toSize(value:componentLabelSize, defaultValue: "14px")
        self.componentSize = Utils.toSize(value:componentSize, defaultValue: "14px")
        self.fontFamily = Utils.toFontFamily(value:fontFamily, defaultValue:"Arial")
        self.size = Utils.toSize(value:size, defaultValue: "12px")
        self.weight = Utils.toWeight(value:weight, defaultValue:"normal")
    }
    
    func toHtml() -> String{
        return String(format:"""
            text: {
                    componentLabelSize: "%@",
                    componentSize: "%@",
                    fontFamily: "%@",
                    size: "%@",
                    weight: "%@",
            }
        """, arguments: [componentLabelSize, componentSize, fontFamily, size, weight])
    }
    
}
