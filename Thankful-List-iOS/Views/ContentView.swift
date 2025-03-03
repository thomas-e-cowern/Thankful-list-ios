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
            Tab("Add Thanks", systemImage: "heart.square") {
                NavigationStack {
                    AddThanksView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
