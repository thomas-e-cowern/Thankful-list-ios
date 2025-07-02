//
//  Thankful_List_iOSApp.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/3/25.
//

import SwiftUI
import SwiftData

@main
struct Thankful_List_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Thanks.self, isUndoEnabled: true)
        }
    }
}
