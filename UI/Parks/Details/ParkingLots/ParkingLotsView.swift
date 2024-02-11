//
//  ParkingLotsView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct ParkingLotsView: View {
	@EnvironmentObject var networkMonitor: NetworkMonitor
	@State private var viewModel: ParkingLotsViewModel = ParkingLotsViewModel()
	@State private var showError: Bool = false
	@State private var showConnectionError: Bool = false
	let park: Park

	var body: some View {
		Group {
			if !viewModel.parkingLots.isEmpty{
				ScrollView {
					LazyVStack {
						ForEach(viewModel.parkingLots) { parkingLot in
							SingleInfoView(
								imageUrl: parkingLot.images.first?.url,
								name: parkingLot.name
							)
							.onAppear {
								if parkingLot.id == viewModel.parkingLots.last!.id {
									viewModel.loadMore(for: park.parkCode)
								}
							}
						}
					}
				}
			} else {
				ProgressView("Loading parking lots")
			}
		}
		.navigationTitle("Parking lots")
		.navigationBarTitleDisplayMode(.inline)
		.padding(.horizontal)
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
	ParkingLotsView(park: Park.preview)
}
