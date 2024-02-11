//
//  ParkRepository.swift
//  Parkology
//

import Foundation

struct ParkRepository {
	func getParks(startFrom: Int = 0) async throws -> ParkResponse {
		try await NetworkService.getParks(startFrom: startFrom)
	}

	func getParkingLots(for park: Park, startFrom: Int = 0) {
		
	}

	func getVisitingCetners(for park: Park, startFrom: Int = 0) {
		
	}
}
