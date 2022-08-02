//
//  File.swift
//  
//
//  Created by Abound on 7/25/22.
//

import Foundation
import WebKit

class WebViewOnSuccess : NSObject, WKScriptMessageHandler {
    var onSuccess: (() -> Void)? = nil
    
    public init(onSuccess: (() -> Void)? = nil){
        self.onSuccess = onSuccess
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("documentReady")
        print("Message received: \(message.name) with body: \(message.body)")
        if(onSuccess != nil){
            onSuccess?()
        }
    }
}
