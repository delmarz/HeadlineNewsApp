//
//  BaseTabView.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import SwiftUI

struct BaseTabView : View {
    private let context = CoreDataManager.shared.managedObjectContext
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
										Text("News")
                    Image(systemName: "globe")
                        .font(.system(size: 22))
                }
            FavoritesView()
                .environment(\.managedObjectContext, context)
                .tabItem {
									Text("Favorites")
                    Image(systemName: "heart.fill")
                        .font(.system(size: 22))
                }
        }
        .accentColor(.black)
    }
}
