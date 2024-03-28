//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Abound on 7/4/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
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
    
    class Coordinator: NSObject, WKUIDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(
            _ webView: WKWebView,
            createWebViewWith configuration: WKWebViewConfiguration,
            for navigationAction: WKNavigationAction,
            windowFeatures: WKWindowFeatures
        ) -> WKWebView? {
            guard let url = navigationAction.request.url else { return nil }
            
            UIApplication.shared.open(url)
            return nil
        }
    }
    
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
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
  
    func makeUIView(context: Context) -> WKWebView {
        let config = createWebViewConfig()
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.uiDelegate = context.coordinator
        
        let domain = URL(string: "https://api.withabound.com")!
        webView.loadHTMLString(getHTML(), baseURL: domain)
    }
    
    private func createWebViewConfig() -> WKWebViewConfiguration {
        let onCallbackHandler = WebViewCallbacks(onSuccess: self.onSuccess, onError: self.onError)
        
        let controller = WKUserContentController()
        controller.add(onCallbackHandler , name: "onSuccess")
        controller.add(onCallbackHandler , name: "onError")
        
        let config = WKWebViewConfiguration()
        config.userContentController = controller
        
        return config
    }
    
    private func getHTML() -> String{
        if currentType == DocumentType.taxDocument{
            return String(format: taxDocumentHTML, arguments: [theme.toHtml(),customContent.toHtml(),accessToken,year])
        }else{
            return String(format: taxProfileHTML, arguments: [theme.toHtml(),customContent.toHtml(),accessToken])
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            print("Message received: \(message.name) with body: \(message.body)")
    }
  
}
