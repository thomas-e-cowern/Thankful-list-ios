//
//  ContentView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var index: Int = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            
            switch index {
            case 0:
                HomeView()
            case 1:
                ListThanksView()
            case 2:
                FavoritesView()
            case 3:
                SettingsView()
            default :
                HomeView()
            }
            
            TLCustomTabBarView(index: $index)
        }
        .ignoresSafeArea(.all)
        .tint(TLCustomColors.accentsColors)
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
