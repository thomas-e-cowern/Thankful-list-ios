//
//  ContentView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Thanks List", systemImage: "list.star") {
                NavigationStack {
                    ListThanksView()
                }
            }
            
            Tab("Add Thanks", systemImage: "gear.circle") {
                NavigationStack {
                    SettingsView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
