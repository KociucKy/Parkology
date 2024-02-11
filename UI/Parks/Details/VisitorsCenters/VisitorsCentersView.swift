//
//  VisitorsCentersView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

// TODO: - Error handling
struct VisitorsCentersView: View {
	@State private var viewModel: VisitorsCenterViewModel = VisitorsCenterViewModel()
	let park: Park
	
	var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(viewModel.centers) { center in
					VisitorsCenterRowView(center: center)
						.onAppear {
							if center.id == viewModel.centers.last!.id {
								viewModel.loadMore(for: park.id)
							}
						}
				}
			}
		}
		.padding(.horizontal)
		.navigationTitle("Visitors Centers")
		.navigationBarTitleDisplayMode(.inline)
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
