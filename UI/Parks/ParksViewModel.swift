//
//  ParksViewModel.swift
//  Parkology
//

import Foundation
import Observation

//TODO: - Error Handling
@Observable
final class ParksViewModel {
	private(set) var parks: [Park] = []
	var error: NetworkingError?

	@ObservationIgnored
	private var repository: ParkRepository = ParkRepository()
	@ObservationIgnored
	private var startFrom: Int = 0

	@MainActor
	func getData() async throws {
		do {
			parks = try await repository.getParks().data
		} catch {
			self.error = error as? NetworkingError
		}
	}

	@MainActor
	func loadMore() {
		Task {
			do {
				startFrom += 20
				let moreParks = try await repository.getParks(startFrom: startFrom).data
				parks.append(contentsOf: moreParks)
			} catch {
				self.error = error as? NetworkingError
			}
		}
	}
}
