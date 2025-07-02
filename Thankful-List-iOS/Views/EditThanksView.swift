//
//  EditThanksView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/26/25.
//

import SwiftUI

struct EditThanksView: View {
    
    @Bindable var thanks: Thanks
    @Environment(\.dismiss) var dismiss
    
    @State private var showIconView: Bool = false
    @State private var selectedIcon: Icons = .star
    @State private var selectedColor: Color = .blue
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("I'm grateful for...", text: $thanks.title)
                    TextField("Why?", text: $thanks.reason)
                    HStack {
                        Text("Mark as favorite")
                        
                        Spacer()
                        
                        Button {
                            thanks.isFavorite.toggle()
                        } label: {
                            thanks.isFavorite ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                        }
                    }
                    Image(systemName: thanks.icon)
                        .foregroundStyle(thanks.hexColor)
                }
                
                
            }
            
            Section {
                HStack() {
                    Button("Save") {
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
        .navigationTitle("\(thanks.title)")
    }
}

#Preview {
    EditThanksView(thanks: Thanks.sampleThanks[2])
}
