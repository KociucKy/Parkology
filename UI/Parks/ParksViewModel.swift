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
	private var currentPage: Int = 0

	func getData() async throws {
		parks = try await repository.getParks().data
	}

	@MainActor
	func loadMore(_ park: Park) {
		Task {
			// TODO: - Handle force try
			currentPage += 1
			let moreParks = try await repository.getParks(page: currentPage).data.filter { !parks.contains($0) }
			parks.append(contentsOf: moreParks)
		}
	}
}
