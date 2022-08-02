//
//  AboundThemeConfig.swift
//  Abound
//
//  Created by Abound on 7/5/22.
//

import Foundation
import SwiftUI

public class AboundThemeConfig{
    var text: AboundThemeText
    var color: AboundThemeColor
    var shape: AboundThemeShape
    var button: AboundThemeButton
    public init(
        text:AboundThemeText=AboundThemeText() ,
        color:AboundThemeColor=AboundThemeColor() ,
        shape:AboundThemeShape=AboundThemeShape() ,
        button:AboundThemeButton=AboundThemeButton()
    ){
        self.text = text
        self.color = color
        self.shape = shape
        self.button = button
    }
    
    func toHtml() -> String{
        return String(format:"""
        const customTheme = {
            %@,
            %@,
            %@,
            %@,
        };
        """, arguments: [text.toHtml(), color.toHtml(), shape.toHtml(), button.toHtml()])
    }
  
}
