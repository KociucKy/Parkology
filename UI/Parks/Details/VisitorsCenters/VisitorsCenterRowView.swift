//
//  VisitorsCenterRowView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct VisitorsCenterRowView: View {
	let center: VisitorCenter
	
	var body: some View {
		HStack(spacing: 16) {
			if let url = center.images.first?.url {
				AsyncImage(url: URL(string: url)) { image in
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
			Text(center.name)
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
	VisitorsCenterRowView(center: VisitorCenter.previews)
}
