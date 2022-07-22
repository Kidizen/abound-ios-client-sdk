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
    var onSuccess: (() -> Void)? = nil
    var onError: (() -> Void)? = nil
    
    public init(theme: AboundTheme = AboundTheme(), onSuccess: (() -> Void)? = nil, onError: (() -> Void)? = nil) {
        self.theme = theme
        self.onSuccess = onSuccess
    }
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        WebView(currentType: DocumentType.taxProfile, accessToken: Abound.accessToken, theme: theme, year: "2022", onSuccess: onSuccess,onError: onError)
    }
}

struct TaxProfile_Previews: PreviewProvider {
    static var previews: some View {
        TaxProfile()
    }
}
