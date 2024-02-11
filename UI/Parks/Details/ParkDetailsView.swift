//
//  ParkDetailsView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI
import SwiftData

struct ParkDetailsView: View {
	@EnvironmentObject var networkMonitor: NetworkMonitor
	@Environment(\.modelContext) private var context
	@Query private var favoriteParks: [SDPark]
	@State private var isInFavorites: Bool = false
	@State private var showConnectionError: Bool = false
	let park: Park
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 8) {
				if let url = park.images.first?.url {
					AsyncImage(url: URL(string: url)) { image in
						image
							.resizable()
							.scaledToFit()
					} placeholder: {
						Color.gray
							.opacity(0.5)
							.overlay {
								Image(systemName: "photo.fill")
									.font(.largeTitle)
							}
							.frame(height: 300)
					}
					Text(park.fullName)
						.font(.title)
						.fontWeight(.semibold)
					Text(park.description)
						.font(.subheadline)
					NavigationLink {
						VisitorsCentersView(park: park)
					} label: {
						Text("Check visitor centers")
						Image(systemName: "chevron.right")
					}
					.buttonStyle(.borderedProminent)
					.tint(.parkPurple)
					NavigationLink {
						ParkingLotsView(park: park)
					} label: {
						Text("Check parking lots")
						Image(systemName: "chevron.right")
					}
					.buttonStyle(.borderedProminent)
					.tint(.parkPurple)
					Button {
						if isInFavorites {
							deleteFromFavorites()
						} else {
							addParkToFavorites()
						}
					} label: {
						Image(systemName: isInFavorites ? "trash.fill" : "plus.circle.fill")
						Text(isInFavorites ? "Delete from favorites" : "Add to favorites")
					}
					.buttonStyle(.borderedProminent)
					.tint(.parkPurple)
				}
				Spacer()
			}
		}
		.padding(.horizontal)
		.navigationTitle(park.name)
		.navigationBarTitleDisplayMode(.inline)
		.onAppear {
			if let _ = favoriteParks.first(where: {$0.id == park.id}) {
				isInFavorites = true
			} else {
				isInFavorites = false
			}
		}
		.onChange(of: networkMonitor.isConnected) { _, newValue in
			if !newValue {
				showConnectionError = true
			}
		}
		.fullScreenCover(isPresented: $showConnectionError) {
			NoNetworkView()
		}
	}

	private func addParkToFavorites() {
		let sdPark = SDPark(id: park.id, name: park.fullName, imageUrl: park.images.first?.url)
		context.insert(sdPark)
		isInFavorites = true
	}

	private func deleteFromFavorites() {
		let parkToDelete = favoriteParks.first(where: {$0.id == park.id})
		if let parkToDelete {
			context.delete(parkToDelete)
			isInFavorites = false
		}
	}
}

#Preview {
	NavigationStack {
		ParkDetailsView(park: Park.preview)
	}
}
