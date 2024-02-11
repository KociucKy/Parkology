//
//  VisitorsCenterViewModel.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation
import Observation

//TODO: - Error Handling
@Observable
final class VisitorsCenterViewModel {
	private(set) var centers: [VisitorCenter] = []
	var error: NetworkingError?

	@ObservationIgnored
	private var repository: VisitorsCenterRepository = VisitorsCenterRepository()
	@ObservationIgnored
	private var startFrom: Int = 0

	@MainActor
	func getData(for parkId: String) async throws {
		do {
			centers = try await repository.getCenters(for: parkId).data
		} catch {
			self.error = error as? NetworkingError
		}
	}

	@MainActor
	func loadMore(for parkId: String) {
		Task {
			do {
				startFrom += 20
				let moreCenters = try await repository.getCenters(for: parkId, startFrom: startFrom).data
				centers.append(contentsOf: moreCenters)
			} catch {
				self.error = error as? NetworkingError
			}
		}
	}
}
