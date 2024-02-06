//
//  FavouritesView.swift
//  Parkology
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.title)
                .padding(4)
            Text("Favourites View")
                .font(.title)
                .bold()
        }
        .foregroundStyle(.parkPurple)
    }
}

#Preview {
    FavouritesView()
}
