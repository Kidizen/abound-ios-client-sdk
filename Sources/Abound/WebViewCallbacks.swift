//
//  File.swift
//  
//
//  Created by Abound on 7/25/22.
//

import Foundation
import WebKit

class WebViewCallbacks : NSObject, WKScriptMessageHandler {
    var onSuccess: (() -> Void)? = nil
    var onError: ((TaxError) -> Void)? = nil
    
    public init(onSuccess: (() -> Void)? = nil, onError: ((TaxError) -> Void)? = nil){
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name=="onSuccess"){
            if(onSuccess != nil){
                onSuccess?()
            }
        }else{
            if(onError != nil){
                onError?(TaxError(error:(message.body as? String ?? "Error")))
            }
        }
    }
}
