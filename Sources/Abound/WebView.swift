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
    var onError: (() -> Void)? = nil
    
  
    func makeUIView(context: Context) -> WKWebView {
        let onSuccessHandler = WebViewOnSuccess(onSuccess: self.onSuccess)
        let controller = WKUserContentController()
        controller.add(onSuccessHandler , name: "onSuccess")
        let config = WKWebViewConfiguration()
        config.userContentController = controller
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func getHTML() -> String{
        if currentType == DocumentType.taxDocument{
            return String(format: taxDocumentHTML, arguments: [accessToken,theme.toHtml(),customContent.toHtml(),year])
        }else{
            return String(format: taxProfileHTML, arguments: [accessToken,theme.toHtml(),customContent.toHtml(),year])
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

