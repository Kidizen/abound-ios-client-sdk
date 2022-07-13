//
//  TaxProfile.swift
//  Abound
//
//  Created by Hansy Schmitt on 7/12/22.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct TaxProfile: View {
    var theme: AboundTheme
    
    init(theme: AboundTheme = AboundTheme()) {
        self.theme = theme
    }
    
    @available(iOS 13.0.0, *)
    var body: some View {
        WebView(currentType: DocumentType.taxProfile, accessToken: Abound.accessToken, theme: theme, year: "2022")
    }
}

struct TaxProfile_Previews: PreviewProvider {
    static var previews: some View {
        TaxProfile()
    }
}
