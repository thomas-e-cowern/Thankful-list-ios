//
//  ThanksRowView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/26/25.
//

import SwiftUI

struct ThanksRowView: View {
    
    var thanks: Thanks
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: thanks.icon)
                    .foregroundStyle(thanks.hexColor.opacity(0.8))
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading) {
                    Text(thanks.title)
                    
                    Text("\(thanks.date, style: .date)")
                        .font(.caption)
                }
                .foregroundStyle(TLCustomColors.textColors)
                
                Spacer()
                Image(systemName: thanks.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ThanksRowView(thanks: Thanks.sampleThanks[1])
}
