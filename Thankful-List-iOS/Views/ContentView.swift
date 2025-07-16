//
//  ContentView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var index: Int = 0
    @State private var path = NavigationPath()
    @Environment(\.modelContext) private var modelContext
    
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
            
            TLCustomTabBarView(index: $index, path: $path, thanks: <#Binding<Thanks>#>)
        }
        .ignoresSafeArea(.all)
        .tint(TLCustomColors.accentsColors)
    }
    
    func addThanks() {
        let newThanks = Thanks(title: "", body: "", date: Date.now, isFavorite: false, icon: Icons.star.rawValue, color: "#007AFF")
        modelContext.insert(newThanks)
        path.append(newThanks)
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
