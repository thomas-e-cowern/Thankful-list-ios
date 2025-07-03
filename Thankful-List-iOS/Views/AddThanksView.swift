//
//  AddThanksView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI

struct AddThanksView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var title: String = ""
    @State private var reason: String = ""
    @State private var isFavorite: Bool = false
    @State private var selectedIcon: Icons = .star
    @State private var selectedColor: Color = .blue
    @State private var showAddView: Bool = false
    
    var disableSave: Bool {
        title.isEmpty || reason.isEmpty
    }
    
    var body: some View {
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
                HStack {
                    Button {
                        showAddView.toggle()
                    } label: {
                        Text("Select Icon")
                    }
                    
                    Spacer()
                    
                    Image(systemName: selectedIcon.rawValue)
                        .foregroundStyle(selectedColor)

                }
                HStack() {
                    Button("Save") {
                        addThanks()
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    .disabled(disableSave)
                    
                    Spacer()
                    
                    Button("Cancel") {
                        // More to come...
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                }
            }
            .sheet(isPresented: $showAddView) {
                IconPickerView(selectedIcon: $selectedIcon, selectedColor: $selectedColor)
                    .presentationDetents([.medium])
            }
        }
    }
    
    func addThanks() {
        let newThanks = Thanks(title: title, body: reason, date: Date(), isFavorite: isFavorite, icon: selectedIcon.rawValue, color: selectedColor.toHexString() ?? "#007AFF")
        modelContext.insert(newThanks)
        do {
            try modelContext.save()
        } catch {
            print("Unable to save thanks...")
        }
        
    }
}

#Preview {
    AddThanksView()
}
