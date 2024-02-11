//
//  ParkingLotsViewModel.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation
import Observation

@Observable
final class ParkingLotsViewModel {
	private(set) var parkingLots: [ParkingLot] = []

	@ObservationIgnored
	private var repository: ParkingLotRepository = ParkingLotRepository()
	@ObservationIgnored
	private var startFrom: Int = 0

	@MainActor
	func getData(for parkId: String) async throws {
		parkingLots = try await repository.getParkingLots(for: parkId).data
	}

	@MainActor
	func loadMore(for parkId: String) {
		Task {
			startFrom += 20
			let moreParkingLots = try await repository.getParkingLots(for: parkId, startFrom: startFrom).data
			parkingLots.append(contentsOf: moreParkingLots)
		}
	}
}
