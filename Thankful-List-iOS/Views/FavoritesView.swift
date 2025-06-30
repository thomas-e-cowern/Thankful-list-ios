//
//  FavoritesView.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 6/25/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var thanksList: [Thanks]
    @Query(filter: #Predicate<Thanks> { thanks in
        
        thanks.isFavorite == true
        
    }) var favoriteThanks: [Thanks]
    @State private var path = [Thanks]()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            ZStack {
                TLCustomColors.backgroundColors.ignoresSafeArea()
                VStack {
                    List {
                        ForEach(favoriteThanks) { thanks in
                            HStack {
                                NavigationLink(value: thanks) {
                                    ThanksRowView(thanks: thanks)
                                }
                            }
                        }
                        .onDelete(perform: deleteThanks)
                        .foregroundStyle(TLCustomColors.textColors)
                    }
                }
            }
            .navigationTitle("Favorites List")
            .navigationDestination(for: Thanks.self) { thanks in
                EditThanksView(thanks: thanks)
            }
        }
    }
    
    func deleteThanks(at offsets: IndexSet) {
        for offset in offsets {
            let thanks = thanksList[offset]
            modelContext.delete(thanks)
            do {
                try modelContext.save()
            } catch {
                print("Unable to delete thanks...")
            }
            
        }
    }
}

#Preview {
    FavoritesView()
}
