//
//  ParkingLotRepository.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

struct ParkingLotRepository {
	func getParkingLots(for parkId: String, startFrom: Int = 0) async throws -> ParkingLotResponse {
		try await NetworkService.getParkingLots(for: parkId, startFrom: startFrom)
	}
}
