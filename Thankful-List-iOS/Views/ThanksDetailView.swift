//
//  ThanksDetailView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/26/25.
//

import SwiftUI

struct ThanksDetailView: View {
    
    var thanks: Thanks
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: thanks.icon)
                    .font(.title)
                    .foregroundStyle(thanks.hexColor)
                Text(thanks.title)
                    .font(.headline)
            }
            .padding()
            
            VStack {
                
                Text(thanks.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                Text(thanks.reason)
            }
        }
    }
}

#Preview {
    ThanksDetailView(thanks: Thanks.sampleThanks[3])
}
