//
//  ParkRepository.swift
//  Parkology
//

import Foundation

struct ParkRepository {
    func getParks(page: Int = 0) async throws -> ParkResponse {
        try await NetworkService.getParks(page: page)
    }
}
