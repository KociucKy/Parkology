//
//  VisitorsCenterRowView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct SingleInfoView: View {
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
						.overlay {
							ProgressView()
						}
				}
			} else {
				placeholderImage
					.overlay {
						Image(systemName: "photo.fill")
							.font(.largeTitle)
					}
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
	}
}

#Preview {
	SingleInfoView(imageUrl: "", name: "Cool place")
}
