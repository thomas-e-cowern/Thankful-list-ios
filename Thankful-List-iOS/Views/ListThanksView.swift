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
        List {
            ForEach(thanksList) { thanks in
                Text(thanks.title)
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
