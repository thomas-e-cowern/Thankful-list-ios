//
//  EditThanksView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/26/25.
//

import SwiftUI

struct EditThanksView: View {
    
    @Bindable var thanks: Thanks
    
    var body: some View {
        Form {
            Section {
                TextField("I'm grateful for...", text: $thanks.title)
                TextField("Why?", text: $thanks.reason)
            }
        }
    }
}

#Preview {
    EditThanksView(thanks: Thanks.sampleThanks[2])
}
