//
//  ParksViewModel.swift
//  Parkology
//

import Foundation
import Observation

@Observable
class ParksViewModel {
	private(set) var parks: [Park] = []

	@ObservationIgnored
	private var repository: ParkRepository = ParkRepository()
	@ObservationIgnored
	private var startFrom: Int = 0

	func getData() async throws {
		parks = try await repository.getParks().data
	}

	@MainActor
	func loadMore(_ park: Park) {
		Task {
			// TODO: - Handle force try
			startFrom += 20
			let moreParks = try await repository.getParks(startFrom: startFrom).data
			parks.append(contentsOf: moreParks)
		}
	}
}
