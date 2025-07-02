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
                    HStack {
                        Text("Icon")
                        
                        Spacer()
                        
                        Image(systemName: thanks.icon)
                            .foregroundStyle(thanks.hexColor)
                    }
                    
//                    LazyVGrid(columns: columns, spacing: 20) {
//                        ForEach(Icons.allCases) { icon in
//                            Button {
//                                // More to come...
//                            } label: {
//                                HStack {
//                                    Image(systemName: icon.rawValue)
//                                        .foregroundStyle(thanks.hexColor)
//                                }
//                            }
//                        }
//                    }
                    
                    
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
            } // End of form
        }
        .navigationTitle("\(thanks.title)")
    }
}

#Preview {
    EditThanksView(thanks: Thanks.sampleThanks[2])
}
