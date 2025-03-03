//
//  Thanks.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI
import SwiftData

@Model
class Thanks: Identifiable {
    var id = UUID()
    var title: String
    var reason: String
    var date: Date
    var isFavorite: Bool
    @Attribute(.externalStorage) var photo: Data? = nil
    
    init(title: String, body: String, date: Date, isFavorite: Bool) {
        self.title = title
        self.reason = body
        self.date = date
        self.isFavorite = isFavorite
    }
}

extension Thanks {
    
    static var sampleThanks: [Thanks] {
        [
            Thanks(title: "My home", body: "I am thankful for the roof over my head", date: Date(), isFavorite: false),
            Thanks(title: "My car", body: "My car takes me where I need to go", date: Date(), isFavorite: true),
            Thanks(title: "My freinds", body: "They help my out", date: Date(), isFavorite: true),
            Thanks(title: "Food", body: "It nourishes my body", date: Date(), isFavorite: false),
            Thanks(title: "TV", body: "It keeps me entertained", date: Date(), isFavorite: false),
            Thanks(title: "Radio", body: "For when the TV doesn't work", date: Date(), isFavorite: true)
        ]
    }
    
//    @MainActor
//    static var preview: ModelContainer {
//        let container = try! ModelContainer(for: Thanks.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
//        
//        container.mainContext.insert(Thanks(title: "My home", body: "I am thankful for the roof over my head", date: Date(), isFavorite: false))
//        container.mainContext.insert(Thanks(title: "My car", body: "My car takes me where I need to go", date: Date(), isFavorite: true))
//        container.mainContext.insert(Thanks(title: "My freinds", body: "They help my out", date: Date(), isFavorite: true))
//        container.mainContext.insert(Thanks(title: "Food", body: "It nourishes my body", date: Date(), isFavorite: false))
//        container.mainContext.insert(Thanks(title: "TV", body: "It keeps me entertained", date: Date(), isFavorite: false))
//        container.mainContext.insert(Thanks(title: "Radio", body: "For when the TV doesn't work", date: Date(), isFavorite: true))
//        
//        return container
//    }
}
