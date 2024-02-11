//
//  VisitorsCentersView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct VisitorsCentersView: View {
	@State private var viewModel: VisitorsCenterViewModel = VisitorsCenterViewModel()
	let park: Park
	
	var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(viewModel.centers) { center in
					Text(center.name)
				}
			}
		}
		.task {
			do {
				try await viewModel.getData(for: park.id)
			} catch {
				print(error)
			}
		}
	}
}

#Preview {
	VisitorsCentersView(park: Park.preview)
}
