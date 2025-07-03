//
//  CenterViewModifier.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 7/3/25.
//

import SwiftUI

struct Center: ViewModifier {
    func body(content: Content) -> some View {
        Spacer()
        content
        Spacer()
    }
}

extension View {
    public func centered() -> some View {
        modifier(Center())
    }
}
