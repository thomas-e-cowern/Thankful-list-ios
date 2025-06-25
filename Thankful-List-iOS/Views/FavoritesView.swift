//
//  FavoritesView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/25/25.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        
        ZStack {
            TLCustomColors.backgroundColors.ignoresSafeArea()
            List {
                ForEach(0..<10) { _ in
                    HStack() {
                        VStack(alignment: .leading) {
                            Text("Something I'm thankful for")
                            Text("Feb 1, 2025")
                                .font(.caption)
                        }
                        Spacer()
                        Image(systemName: "heart.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
