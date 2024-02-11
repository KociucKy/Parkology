//
//  ParkingLotsView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct ParkingLotsView: View {
	@State private var viewModel: ParkingLotsViewModel = ParkingLotsViewModel()
	let park: Park

	var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(viewModel.parkingLots) { parkingLot in
					ParkSpecificInfoRowView(
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
		.task {
			do {
				try await viewModel.getData(for: park.parkCode)
			} catch {
				print(error)
			}
		}
	}
}

#Preview {
	ParkingLotsView(park: Park.preview)
}
