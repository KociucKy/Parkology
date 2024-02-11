//
//  ParkDetailsView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct ParkDetailsView: View {
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
					
				}
				Spacer()
			}
		}
		.navigationTitle(park.name)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .bottomBar) {
				Button {
					
				} label: {
					Image(systemName: "plus.circle.fill")
					Text("Add to favorites")
				}
				.buttonStyle(.borderedProminent)
				.tint(.parkPurple)
			}
		}
	}
}

#Preview {
	NavigationStack {
		ParkDetailsView(park: Park.preview)
	}
}
