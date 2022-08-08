//
//  HTMLContent.swift
//  Abound
//
//  Created by Abound on 7/9/27.
//

import Foundation
import SwiftUI

public class AboundCustomTextContent{
    var submitButton: String
    var loadingButton: String
    var loadingPrompt: String
    var errorMessage: String
    
    public init(
        submitButton: String = "Submit" ,
        loadingButton: String = "Loading" ,
        loadingPrompt: String = "This should take less than 10 seconds." ,
        errorMessage: String = "Invalid"
    ){
        self.submitButton = Utils.toText(value: submitButton, defaultValue: "Submit")
        self.loadingButton = Utils.toText(value: loadingButton, defaultValue: "Loading...")
        self.loadingPrompt = Utils.toText(value: loadingPrompt, defaultValue: "This should take less than 10 seconds.")
        self.errorMessage = Utils.toText(value: errorMessage, defaultValue: "Invalid")
    }
    
    func toHtml() -> String{
        return String(format:"""
        const customContent = {
            submitButton: "%@",
            loadingButton: "%@",
            loadingPrompt: "%@",
            errorMessage: "%@",
        };
        """, arguments: [submitButton, loadingButton, loadingPrompt, errorMessage])
    }
  
}
