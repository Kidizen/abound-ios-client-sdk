//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Abound on 7/4/22.
//

import SwiftUI



@available(iOS 13.0.0, *)
public struct TaxDocument: View {
  
    var theme: AboundTheme
    var year: String
    var onSuccess: (() -> Void)? = nil
    var onError: ((TaxError) -> Void)? = nil
    
    public init(
        theme: AboundTheme = AboundTheme(),
        year: String,
        onSuccess: (() -> Void)? = nil,
        onError: ((TaxError) -> Void)? = nil
    ) {
        self.theme = theme
        self.year = year
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        WebView(
            currentType: DocumentType.taxDocument,
            accessToken: Abound.accessToken,
            theme:theme,
            customContent: AboundCustomTextContent(),
            year:year,
            onSuccess:onSuccess,
            onError:onError
        )
    }
}

