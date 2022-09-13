//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Abound on 7/4/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{

    var currentType: DocumentType
    var accessToken: String
    var theme: AboundTheme
    var customContent: AboundCustomTextContent
    var year: String
    var onSuccess: (() -> Void)? = nil
    var onError: ((TaxError) -> Void)? = nil
    var debug: Bool
  
    func makeUIView(context: Context) -> WKWebView {
        let onCallbackHandler = WebViewCallbacks(onSuccess: self.onSuccess, onError: self.onError)
        let controller = WKUserContentController()
        controller.add(onCallbackHandler , name: "onSuccess")
        controller.add(onCallbackHandler , name: "onError")
        let config = WKWebViewConfiguration()
        config.userContentController = controller     
        return  WKWebView(frame: .zero, configuration: config)
    }
    
    func getHTML() -> String{
        let debugMode = debug ?  "const debugMode  = true": "const debugMode  = false"
        
        if currentType == DocumentType.taxDocument{
            return String(format: taxDocumentHTML, arguments: [debugMode,accessToken,theme.toHtml(),customContent.toHtml(),year])
        }else{
            return String(format: taxProfileHTML, arguments: [debugMode,accessToken,theme.toHtml(),customContent.toHtml(),year])
        }
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let domain = URL(string: "https://api.withabound.com")!
        webView.loadHTMLString(getHTML(), baseURL: domain)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            print("Message received: \(message.name) with body: \(message.body)")
    }
  
}

