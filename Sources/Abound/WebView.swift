//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Abound on 7/4/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    typealias OnSuccessCallback = () -> Void
    typealias OnErrorCallback = (TaxError) -> Void

    let currentType: DocumentType
    let accessToken: String
    let theme: AboundTheme
    let customContent: AboundCustomTextContent
    let year: String
    let onSuccess: OnSuccessCallback?
    let onError: OnErrorCallback?
    let debug: Bool
    
    init(
        currentType: DocumentType,
        accessToken: String,
        theme: AboundTheme,
        customContent: AboundCustomTextContent,
        year: String,
        onSuccess: OnSuccessCallback? = nil,
        onError: OnErrorCallback? = nil,
        debug: Bool
    ) {
        self.currentType = currentType
        self.accessToken = accessToken
        self.theme = theme
        self.customContent = customContent
        self.year = year
        self.onSuccess = onSuccess
        self.onError = onError
        self.debug = debug
    }
  
    func makeUIView(context: Context) -> WKWebView {
        let config = createWebViewConfig()
        let webView = WKWebView(frame: .zero, configuration: config)
        
        let domain = URL(string: "https://api.withabound.com")!
        webView.loadHTMLString(getHTML(), baseURL: domain)
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
    
    private func createWebViewConfig() -> WKWebViewConfiguration {
        let onCallbackHandler = WebViewCallbacks(onSuccess: self.onSuccess, onError: self.onError)
        
        let controller = WKUserContentController()
        controller.add(onCallbackHandler , name: "onSuccess")
        controller.add(onCallbackHandler , name: "onError")
        
        let config = WKWebViewConfiguration()
        config.userContentController = controller
        
        return config
    }
    
    func getHTML() -> String{
        let debugMode = debug ?  "const debugMode  = true": "const debugMode  = false"
        
        if currentType == DocumentType.taxDocument{
            return String(format: taxDocumentHTML, arguments: [debugMode,accessToken,theme.toHtml(),customContent.toHtml(),year])
        }else{
            return String(format: taxProfileHTML, arguments: [debugMode,accessToken,theme.toHtml(),customContent.toHtml(),year])
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            print("Message received: \(message.name) with body: \(message.body)")
    }
  
}

