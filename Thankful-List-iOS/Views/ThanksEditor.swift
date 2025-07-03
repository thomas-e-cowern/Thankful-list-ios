//
//  ThanksEditor.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 7/3/25.
//

import SwiftUI

struct ThanksEditor: View {
    
    let thanks: Thanks?
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var title: String = ""
    @State private var reason: String = ""
    @State private var isFavorite: Bool = false
    @State private var selectedIcon: Icons? = .star
    @State private var selectedColor: Color = .blue
    @State private var showAddView: Bool = false
    
    private var editorTitle: String {
        thanks == nil ? "Add Thanks" : "Edit Thanks"
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("What are you grateful for?", text: $title)
                    
                    ZStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            if reason.isEmpty {
                                Text("Why?")
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
                        .foregroundStyle(.red)
                    }
                    
                    Picker("Icons", selection: $selectedIcon) {
                        ForEach(Icons.allCases) { icon in
                            Image(systemName: icon.rawValue).tag(icon)
                                .foregroundStyle(selectedColor)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    VStack {
                        ColorPicker("Set the Icon color", selection: $selectedColor)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } // End of form
            } // End of VStack
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(editorTitle)
                }
            }
            .onAppear {
                if let thanks {
                    title = thanks.title
                    reason = thanks.reason
                    isFavorite = thanks.isFavorite
                    selectedIcon = Icons(rawValue: thanks.icon) ?? .star
                    selectedColor = thanks.hexColor
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            save()
                            dismiss()
                        }
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    
    }
    
    private func save() {
        if let thanks {
            thanks.title = title
            thanks.reason = reason
            thanks.isFavorite = isFavorite
            thanks.icon = selectedIcon?.rawValue ?? Icons.star.rawValue
            thanks.color = selectedColor.toHexString() ?? "#007AFF"
        } else {
            let newThanks = Thanks(title: title, body: reason, date: Date(), isFavorite: isFavorite, icon: selectedIcon?.rawValue ?? Icons.star.rawValue, color: selectedColor.toHexString() ?? "#007AFF")
            modelContext.insert(newThanks)
            do {
                try modelContext.save()
            } catch {
                print("Unable to save thanks...")
            }
        }
    }
}

//#Preview {
//    ThanksEditor(thanks: Thanks.sampleThanks[1], selectedIcon: Icons.star)
//}
