//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Hansy Schmitt on 7/6/22.
//

import Foundation

public class AboundThemeShape{
    var componentBorderWidth: String
    var componentCornerRadius: String
    
    init(componentBorderWidth: String = "1px" ,
         componentCornerRadius: String = "8px"
    ){
        self.componentBorderWidth = Utils.toSize(value:componentBorderWidth, defaultValue: "1px")
        self.componentCornerRadius = Utils.toSize(value:componentCornerRadius, defaultValue: "8px")
    }
    
    func toHtml() -> String{
        return String(format:"""
            shape: {
                componentBorderWidth: "%@",
                componentCornerRadius: "%@",
            }
        """, arguments: [componentBorderWidth, componentCornerRadius])
    }
}
