//
//  HomeView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/25/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            TLCustomColors.backgroundColors.ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Image("gratefullness")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                Text("Welcome to the Grateful List!")
                    .font(.title)
                    .padding()
                
                Text("The Grateful List exists to help you keep track of people, places, experiences and things that you are grateful for in your life.")
                    .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
