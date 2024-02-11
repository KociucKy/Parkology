//
//  ParkRepository.swift
//  Parkology
//

import Foundation

struct ParkRepository {
	func getParks(startFrom: Int = 0) async throws -> ParkResponse {
		try await NetworkService.getParks(startFrom: startFrom)
	}
}
