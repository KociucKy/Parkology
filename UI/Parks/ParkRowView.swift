//
//  ParkRowView.swift
//  Parkology
//

import SwiftUI

struct ParkRowView: View {
	var park: Park
	
	var body: some View {
		VStack(spacing: 0) {
			if let url = park.images.first?.url {
				AsyncImage(url: URL(string: url)) { image in
					image
						.resizable()
						.frame(maxWidth: .infinity)
						.frame(height: 330)
				} placeholder: {
					Color.gray
						.opacity(0.5)
						.frame(maxWidth: .infinity)
						.frame(height: 330)
						.overlay {
							Image(systemName: "photo.fill")
								.font(.largeTitle)
						}
				}
			}
			Text(park.name)
				.font(.headline)
				.foregroundStyle(.black)
				.frame(maxWidth: .infinity)
				.padding(16)
				.background(.parkPurpleGray)
		}
		.frame(height: 400)
		.clipShape(.rect(cornerRadius: 16))
	}
}

#Preview {
	ParkRowView(park: .preview)
}
