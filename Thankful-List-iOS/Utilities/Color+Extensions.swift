//
//  Color+Extensions.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/26/25.
//

import SwiftUI

extension Color {
    init?(hex: String) {
        guard let uiColor = UIColor(hex: hex) else { return nil }
        self.init(uiColor: uiColor)
    }
    
    func toHexString(includeAlpha: Bool = false) -> String? {
        return UIColor(self).toHexString(includeAlpha: includeAlpha)
    }
}
