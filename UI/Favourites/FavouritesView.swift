//
//  FavouritesView.swift
//  Parkology
//

import SwiftUI
import SwiftData

struct FavouritesView: View {
	@Environment(\.modelContext) private var context
	@Query private var favoriteParks: [SDPark]
	@State private var searchPhrase: String = ""
	
	var body: some View {
		NavigationStack {
			Group {
				if !favoriteParks.isEmpty{
					List {
						ForEach(favoriteParks) { park in
							ParkSpecificInfoRowView(imageUrl: park.imageUrl, name: park.name)
						}
						.onDelete { indexSet in
							indexSet.forEach { index in
								let parkToDelete = favoriteParks[index]
								context.delete(parkToDelete)
							}
						}
					}
					.listStyle(.plain)
				} else {
					ContentUnavailableView("You haven't added any parks yet", systemImage: "xmark.bin.fill")
				}
			}
			.navigationTitle("Favorites")
		}
	}
}

#Preview {
	FavouritesView()
}
