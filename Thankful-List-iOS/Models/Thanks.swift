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
    var body: String
    var date: Date
    var isFavorite: Bool
    var image: Image?
    
    init(title: String, body: String, date: Date, isFavorite: Bool, image: Image? = nil) {
        self.title = title
        self.body = body
        self.date = date
        self.isFavorite = isFavorite
        self.image = image
    }
}

extension Thanks {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Thanks.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Thanks(title: "My home", body: "I am thankful for the roof over my head", date: Date(), isFavorite: false))
        container.mainContext.insert(Thanks(title: "My car", body: "My car takes me where I need to go", date: Date(), isFavorite: true))
        container.mainContext.insert(Thanks(title: "My freinds", body: "They help my out", date: Date(), isFavorite: true))
        container.mainContext.insert(Thanks(title: "Food", body: "It nourishes my body", date: Date(), isFavorite: false))
        container.mainContext.insert(Thanks(title: "TV", body: "It keeps me entertained", date: Date(), isFavorite: false))
        container.mainContext.insert(Thanks(title: "Radio", body: "For when the TV doesn't work", date: Date(), isFavorite: true))
    }
}
