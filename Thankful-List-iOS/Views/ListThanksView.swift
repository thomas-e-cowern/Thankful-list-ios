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
    
    var body: some View {
        VStack {
            List {
                ForEach(thanksList) { thanks in
                    HStack {
                        
                        Image(systemName: thanks.icon)
                            .foregroundStyle(thanks.hexColor.opacity(0.8))
                            .padding(.trailing, 5)
                        
                        VStack(alignment: .leading) {
                            Text(thanks.title)
                            
                            Text("\(thanks.date, style: .date)")
                                .font(.caption)
                        }
                        .foregroundStyle(TLCustomColors.textColors)
                        
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
            .background(TLCustomColors.backgroundColors)
            .scrollContentBackground(.hidden)
            .overlay {
                if thanksList.isEmpty {
                    ContentUnavailableView("You don't have any Thanks yet!  ", image: "heart.square", description: Text("Add something your thankful for to begin the list!"))
                        .background(TLCustomColors.backgroundColors)
                        .foregroundStyle(TLCustomColors.textColors)
                }
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
