//
//  AddThanksView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI

struct AddThanksView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var reason: String = ""
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack {
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
                HStack {
                    Text("Mark as favorite")
                    
                    Spacer()
                    
                    Button {
                        isFavorite.toggle()
                    } label: {
                        isFavorite ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    }
                }
                HStack() {
                    Button("Save") {
                        // More to come...
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    Button("Cancel") {
                        // More to come...
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
    }
}

#Preview {
    AddThanksView()
}
