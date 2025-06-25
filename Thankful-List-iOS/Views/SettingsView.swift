//
//  SettingsView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(spacing: 30) {
            
            Section("Data") {
                VStack(spacing: 20) {
                        Text("The button below will erase all your data and start fresh.")
                        
                    VStack {
                        Text("Caution:")
                            .font(.title2)
                        Text("This will erase all your data and is irreversible")
                    }
                    .foregroundStyle(.red).bold()
                    
                        
                    HStack(spacing: 30) {
                        Text("Erase all data?")
                        Button(role: .destructive) {
                            // More to come...
                        } label: {
                            Text("Erase data")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                Divider()
                    .foregroundStyle(.red)
                
                HStack(spacing: 30) {
                    Text("Export all data?")
                    Button() {
                        // More to come...
                    } label: {
                        Text("Export data")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color(TLCustomColors.backgroundColors)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SettingsView()
}
