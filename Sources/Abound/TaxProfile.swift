//
//  TaxProfile.swift
//  Abound
//
//  Created by Abound on 7/12/22.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct TaxProfile: View {
    var theme: AboundTheme
    var customContent: AboundCustomTextContent
    var onSuccess: (() -> Void)? = nil
    var onError: ((TaxError) -> Void)? = nil
    
    public init(
        theme: AboundTheme = AboundTheme(),
        customContent: AboundCustomTextContent = AboundCustomTextContent(),
        onSuccess: (() -> Void)? = nil,
        onError: ((TaxError) -> Void)? = nil
    ) {
        self.theme = theme
        self.onSuccess = onSuccess
        self.customContent = customContent
        self.onError = onError
    }
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        WebView(
            currentType: DocumentType.taxProfile,
            accessToken: Abound.accessToken,
            theme: theme,
            customContent: customContent,
            year: "2022",
            onSuccess: self.onSuccess,
            onError: self.onError
        )
    }

}

