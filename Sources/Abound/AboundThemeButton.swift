//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Hansy Schmitt on 7/6/22.
//

import Foundation

public class AboundThemeButton{
    var colorActiveBackground: String
    var colorActiveBorder: String
    var colorActiveText: String
    var colorDisabledBackground: String
    var colorDisabledBorder: String
    var colorDisabledText: String
    var colorLoadingBackground: String
    var colorLoadingBorder: String
    var colorLoadingText: String
    var shapeBorderWidth: String
    var shapeCornerRadius: String
    var textFontFamily: String
    var textSize: String
    var textWeight: String


    
    public init(colorActiveBackground: String =  "#000000",
         colorActiveBorder: String = "#000000",
         colorActiveText: String = "#FFFFFF",
         colorDisabledBackground: String = "#C5C5C5",
         colorDisabledBorder: String = "#C5C5C5",
         colorDisabledText: String = "#FFFFFF",
         colorLoadingBackground: String = "#C5C5C5",
         colorLoadingBorder: String = "#C5C5C5",
         colorLoadingText: String = "#FFFFFF",
         shapeBorderWidth: String = "1px",
         shapeCornerRadius: String = "8px",
         textFontFamily: String = "Arial",
         textSize: String = "16px",
         textWeight: String = "normal"
         
    ){
        self.colorActiveBackground = colorActiveBackground
        self.colorActiveBorder = colorActiveBorder
        self.colorActiveText = colorActiveText
        self.colorDisabledBackground = colorDisabledBackground
        self.colorDisabledBorder = colorDisabledBorder
        self.colorDisabledText = colorDisabledText
        self.colorLoadingBackground = colorLoadingBackground
        self.colorLoadingBorder = colorLoadingBorder
        self.colorLoadingText = colorLoadingText
        self.shapeBorderWidth = shapeBorderWidth
        self.shapeCornerRadius = shapeCornerRadius
        self.textFontFamily = textFontFamily
        self.textSize = textSize
        self.textWeight = textWeight
    }
    
    func toHtml() -> String{
        return String(format:"""
            button: {
                    color: {
                        activeBackground: "%@",
                        activeBorder: "%@",
                        activeText: "%@",
                        disabledBackground: "%@",
                        disabledBorder: "%@",
                        disabledText: "%@",
                        loadingBackground: "%@",
                        loadingBorder: "%@",
                        loadingText: "%@",
                    },
                    shape: {
                        borderWidth: "%@",
                        cornerRadius: "%@",
                    },
                    text: {
                        fontFamily: "%@",
                        size: "%@",
                        weight: "%@",
                    },
            }
        """, arguments: [colorActiveBackground, colorActiveBorder, colorActiveText, colorDisabledBackground, colorDisabledBorder
                         , colorDisabledText, colorLoadingBackground, colorLoadingBorder,colorLoadingText,
                         shapeBorderWidth,shapeCornerRadius,textFontFamily,textSize,textWeight
                        ])
    }
}
