//
//  MainView.swift
//  Parkology
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ParksView()
                .tabItem {
                    Label("Parks", systemImage: "tree.fill")
                }
            FavouritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .tint(.parkPurple)
    }
}

#Preview {
    MainView()
}
