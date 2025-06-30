//
//  IconPickerView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/30/25.
//

import SwiftUI

struct IconPickerView: View {

    @State private var selectedIcon: Icons = .star
    @State private var selectedColor: Color = .red
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    IconPickerView()
}
