//
//  IconImages.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/30/25.
//

import Foundation

enum Icons: String, CaseIterable, Identifiable {
    case star = "star.fill"
    case swirl = "swirl.circle.righthalf.filled.inverse"
    case circle = "circle.dotted.circle.fill"
    case person = "person.fill"
    case sun = "sun.min.fill"
    var id: Self { self }
}
