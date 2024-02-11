//
//  VisitorsCenterRowView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct ParkSpecificInfoRowView: View {
	let imageUrl: String?
	let name: String
	
	var body: some View {
		HStack(spacing: 16) {
			if let imageUrl {
				AsyncImage(url: URL(string: imageUrl)) { image in
					image
						.resizable()
						.scaledToFit()
						.clipShape(.rect(cornerRadius: 10))
						.frame(width: 100, height: 100)
				} placeholder: {
					placeholderImage
				}
			} else {
				placeholderImage
			}
			Text(name)
				.font(.headline)
			Spacer()
		}
	}

	private var placeholderImage: some View {
		Color.gray
			.opacity(0.5)
			.frame(width: 100, height: 100)
			.clipShape(.rect(cornerRadius: 10))
			.overlay {
				Image(systemName: "photo.fill")
					.font(.largeTitle)
			}
	}
}

#Preview {
	ParkSpecificInfoRowView(imageUrl: "", name: "Cool place")
}
