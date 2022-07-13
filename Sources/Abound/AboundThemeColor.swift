//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Hansy Schmitt on 7/6/22.
//

import Foundation

class AboundThemeColor{
    var background: String
    var componentBackground: String
    var componentBorder: String
    var componentPlaceholderText: String
    var componentText: String
    var danger: String
    var primary: String
    var text: String

    init(background: String =  "#FFFFFF",
         componentBackground: String = "#FFFFFF",
         componentBorder: String = "#C5C5C5",
         componentPlaceholderText: String = "#C5C5C5",
         componentText: String = "#000000",
         danger: String = "#BC0101",
         primary: String = "#655BEF",
         text: String = "#000000"
    ){
        self.background = Utils.toColor(value:background, defaultValue: "#FFFFFF")
        self.componentBackground =  Utils.toColor(value:componentBackground, defaultValue: "#FFFFFF")
        self.componentBorder =  Utils.toColor(value:componentBorder, defaultValue: "#C5C5C5")
        self.componentPlaceholderText =  Utils.toColor(value:componentPlaceholderText, defaultValue: "#C5C5C5")
        self.componentText =  Utils.toColor(value:componentText, defaultValue: "#000000")
        self.danger =  Utils.toColor(value:danger, defaultValue: "#BC0101")
        self.primary =  Utils.toColor(value:primary, defaultValue: "#655BEF")
        self.text =  Utils.toColor(value:text, defaultValue: "#000000")
    }
    
    func toHtml() -> String{
        return String(format:"""
            color: {
                    background: "%@",
                    componentBackground: "%@",
                    componentBorder: "%@",
                    componentPlaceholderText: "%@",
                    componentText: "%@",
                    danger: "%@",
                    primary: "%@",
                    text: "%@",
            }
        """, arguments: [background, componentBackground, componentBorder, componentPlaceholderText, componentText, danger, primary, text])
    }
}
