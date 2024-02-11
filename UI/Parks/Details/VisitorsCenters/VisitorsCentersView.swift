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
	@State private var showError: Bool = false
	let park: Park
	
	var body: some View {
		Group {
			if !viewModel.centers.isEmpty {
				ScrollView {
					LazyVStack {
						ForEach(viewModel.centers) { center in
							SingleInfoView(
								imageUrl: center.images.first?.url,
								name: center.name
							)
								.onAppear {
									if center.id == viewModel.centers.last!.id {
										viewModel.loadMore(for: park.parkCode)
									}
								}
						}
					}
				}
			} else {
				ProgressView("Loading visitors centers")
			}
		}
		.padding(.horizontal)
		.navigationTitle("Visitors Centers")
		.navigationBarTitleDisplayMode(.inline)
		.task {
			try? await viewModel.getData(for: park.parkCode)
		}
		.onChange(of: viewModel.error) { _, newValue in
			if newValue != nil {
				showError = true
			}
		}
		.alert("Something went wrong", isPresented: $showError) {
			Button("Try again") {
				Task {
					try? await viewModel.getData(for: park.parkCode)
				}
			}
		} message: {
			Text(viewModel.error?.errorDescription ?? "")
		}
	}
}

#Preview {
	VisitorsCentersView(park: Park.preview)
}
