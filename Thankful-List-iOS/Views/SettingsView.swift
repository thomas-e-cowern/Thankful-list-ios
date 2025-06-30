//
//  SettingsView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var showAlert: Bool = false
    
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
                            showAlert.toggle()
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
        .alert("Delete all data?  This is irreversible.", isPresented: $showAlert) {
            Button {
                deleteAllData()
            } label: {
                Text("Delete all data!")
            }

        }
    }
    
    func deleteAllData() {
        do {
            try modelContext.delete(model:Thanks.self)
        } catch {
            fatalError("Error deleting data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SettingsView()
}
