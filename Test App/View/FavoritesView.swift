//
//  FavoritesView.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: HeadlinesArticle.entity(), sortDescriptors: [
        NSSortDescriptor(key: "savingDate", ascending: false)
    ]) var articles: FetchedResults<HeadlinesArticle>

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    ForEach(articles, id: \.self) { article in
											LocalHeadlineRow(headline: article)
                    }
                }
            }
            .navigationBarTitle(Text("Favorites"), displayMode: .automatic)
        }
    }
}
