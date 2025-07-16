//
//  ListThanksView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI
import SwiftData

struct ListThanksView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var thanksList: [Thanks]
    @State private var path = [Thanks]()
    @State private var refreshView = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    ForEach(thanksList) { thanks in
                        HStack {
                            NavigationLink(value: thanks) {
                                ThanksRowView(thanks: thanks)
                            }
                        }
                    }
                    .onDelete(perform: deleteThanks)
                }
                .id(refreshView)
                .background(TLCustomColors.backgroundColors)
                .scrollContentBackground(.hidden)
                .overlay {
                    if thanksList.isEmpty {
                        ContentUnavailableView("You don't have any Thanks yet!", systemImage: "heart.square", description: Text("Add something your grateful for..."))
                            .background(TLCustomColors.backgroundColors)
                            .foregroundStyle(TLCustomColors.textColors)
                    }
                }
            }
//            .onAppear {
//                refreshView.toggle()
//            }
            .navigationTitle("Thankful List")
            .navigationDestination(for: Thanks.self) { thanks in
                EditThanksView(thanks: thanks, selectedIcon: Icons(rawValue: thanks.icon) ?? .star, selectedColor: thanks.hexColor)
            }
        }
    }
    
    func addThanks() {
        let newThanks = Thanks(title: "", body: "", date: Date(), isFavorite: false, icon: "", color: "")
        modelContext.insert(newThanks)
        path.append(newThanks)
        do {
            try modelContext.save()
        } catch {
            print("Unable to save thanks...")
        }
        
    }
    
    func deleteThanks(at offsets: IndexSet) {
        for offset in offsets {
            let thanks = thanksList[offset]
            modelContext.delete(thanks)
            do {
                try modelContext.save()
            } catch {
                print("Unable to delete thanks...")
            }
            
        }
    }
}

#Preview("Empty List") {
    ListThanksView()
        .modelContainer(for: Thanks.self, inMemory: true)
}

#Preview("Thanks List") {
    
    let sampleThanks = Thanks.sampleThanks
    
    let container = try! ModelContainer(for: Thanks.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for thanks in sampleThanks {
        container.mainContext.insert(thanks)
    }
    
    return ListThanksView()
        .modelContainer(container)
}
