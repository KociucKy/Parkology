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
                    if let image = image.image {
                        image
                            .resizable()
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
