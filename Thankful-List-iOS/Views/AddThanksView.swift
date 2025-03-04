//
//  AddThanksView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI

struct AddThanksView: View {
    
    @State private var title: String = ""
    @State private var reason: String = ""
    @State private var isFavorite: Bool = false
    
    
    var body: some View {
        Form {
            TextField("What are you grateful for?", text: $title)
            
            ZStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    if reason.isEmpty {
                        Text("Write a reason why you're grateful.")
                            .foregroundColor(.secondary.opacity(0.5))
                    }
                    
                    TextEditor(text: $reason)
                        .frame(height: 150)
                        .foregroundColor(reason == reason ? .gray : .primary)
                }
            }
            
            Toggle("Mark as Favorite", isOn: $isFavorite)
        }
    }
}

#Preview {
    AddThanksView()
}
