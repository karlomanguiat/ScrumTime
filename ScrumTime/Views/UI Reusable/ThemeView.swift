//
//  ThemeView.swift
//  ScrumTime
//
//  Created by Glenn Karlo Manguiat on 6/4/25.
//

import SwiftUI
import ThemeKit

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(width: 100, height: 30)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(Capsule())
    }
}

#Preview {
    ThemeView(theme: .bubblegum)
}
