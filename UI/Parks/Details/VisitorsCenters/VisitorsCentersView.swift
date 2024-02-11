//
//  VisitorsCentersView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct VisitorsCentersView: View {
	@EnvironmentObject var networkMonitor: NetworkMonitor
	@State private var viewModel: VisitorsCenterViewModel = VisitorsCenterViewModel()
	@State private var showError: Bool = false
	@State private var showConnectionError: Bool = false
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
		.onChange(of: networkMonitor.isConnected) { _, newValue in
			if !newValue {
				showConnectionError = true
			}
		}
		.fullScreenCover(isPresented: $showConnectionError) {
			NoNetworkView()
		}
	}
}

#Preview {
	VisitorsCentersView(park: Park.preview)
}
