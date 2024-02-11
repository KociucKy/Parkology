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

	@ObservationIgnored
	private var repository: VisitorsCenterRepository = VisitorsCenterRepository()
	@ObservationIgnored
	private var startFrom: Int = 0

	@MainActor
	func getData() async throws {
		centers = try await repository.getCenters().data
	}

	// TODO: - Maybe change this to async func
	@MainActor
	func loadMore(_ center: VisitorCenter) {
		Task {
			startFrom += 20
			let moreCenters = try await repository.getCenters(startFrom: startFrom).data
			centers.append(contentsOf: moreCenters)
		}
	}
}
