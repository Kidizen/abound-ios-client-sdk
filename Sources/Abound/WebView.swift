//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Abound on 7/4/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var currentType: DocumentType
    var accessToken: String
    var theme: AboundTheme
    var customContent: AboundCustomTextContent
    var year: String
    var onSuccess: (() -> Void)? = nil
    var onError: (() -> Void)? = nil
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
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
}
