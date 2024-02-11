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
	var error: NetworkingError?

	@ObservationIgnored
	private var repository: ParkingLotRepository = ParkingLotRepository()
	@ObservationIgnored
	private var startFrom: Int = 0

	@MainActor
	func getData(for parkId: String) async throws {
		do {
			parkingLots = try await repository.getParkingLots(for: parkId).data
		} catch {
			self.error = error as? NetworkingError
		}
	}

	@MainActor
	func loadMore(for parkId: String) {
		Task {
			do {
				startFrom += 20
				let moreParkingLots = try await repository.getParkingLots(for: parkId, startFrom: startFrom).data
				parkingLots.append(contentsOf: moreParkingLots)
			} catch {
				self.error = error as? NetworkingError
			}
		}
	}
}
