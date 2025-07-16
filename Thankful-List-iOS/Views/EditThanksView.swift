//
//  EditThanksView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/26/25.
//

import SwiftUI

struct EditThanksView: View {
    
    @Bindable var thanks: Thanks
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var showIconView: Bool = false
    @State var selectedIcon: Icons
    @State var selectedColor: Color
    
    var disableSave: Bool {
        thanks.title.isEmpty || thanks.reason.isEmpty
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("I'm grateful for...", text: $thanks.title)
                    TextField("Why?", text: $thanks.reason, axis: .vertical)
                        .lineLimit(5)
                    HStack {
                        Text("Mark as favorite")
                        
                        Spacer()
                        
                        Button {
                            thanks.isFavorite.toggle()
                        } label: {
                            thanks.isFavorite ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                                
                        }
                        .foregroundStyle(.red)
                    }
                    
                    HStack {
                        Button {
                            showIconView.toggle()
                        } label: {
                            Text("Select Icon")
                        }
                        
                        Spacer()
                        
                        Image(systemName: thanks.icon)
                            .foregroundStyle(thanks.hexColor)
                    }
                    
//                    HStack() {
//                        Group {
//                            Button("Save") {
//                                dismiss()
//                            }
//                            .buttonStyle(.bordered)
//                            
//                            Button("Cancel") {
//                                dismiss()
//                            }
//                            .buttonStyle(.bordered)
//                        }
//                        .centered()
//                    }
//                    .disabled(disableSave)
                }
            } // End of form
        } // End of VStack
        .navigationTitle("\(thanks.title)")
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showIconView, onDismiss: saveChanges) {
            IconPickerView(selectedIcon: $selectedIcon, selectedColor: $selectedColor)
        }
    }
    
    func saveChanges() {
        print("Saved")
        thanks.icon = selectedIcon.rawValue
        thanks.color = selectedColor.toHexString() ?? "#007AFF"
    }
}

#Preview {
    EditThanksView(thanks: Thanks.sampleThanks[2], selectedIcon: Icons.star, selectedColor: Thanks.sampleThanks[2].hexColor)
}
