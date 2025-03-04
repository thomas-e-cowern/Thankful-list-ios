//
//  SettingsView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings View")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("BackgroundColors")
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SettingsView()
}
