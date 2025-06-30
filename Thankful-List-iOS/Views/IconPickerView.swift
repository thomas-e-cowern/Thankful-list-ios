//
//  IconPickerView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/30/25.
//

import SwiftUI

struct IconPickerView: View {
    
    @Binding var selectedIcon: Icons
    @Binding var selectedColor: Color
    
    var body: some View {
        List {
            Picker("Icons", selection: $selectedIcon) {
                ForEach(Icons.allCases) { icon in
                    Image(systemName: icon.rawValue)
                }
            }
            .pickerStyle(.menu)
            
            VStack {
                ColorPicker("Set the Icon color", selection: $selectedColor)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        Image(systemName: selectedIcon.rawValue)
            .font(.largeTitle)
            .foregroundStyle(selectedColor)
        
        Spacer()
    }
}

#Preview {
    IconPickerView(selectedIcon: .constant(.circle), selectedColor: .constant(.red))
}
