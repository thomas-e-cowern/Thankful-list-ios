//
//  Thanks.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI
import SwiftData

@Model
class Thanks {
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

