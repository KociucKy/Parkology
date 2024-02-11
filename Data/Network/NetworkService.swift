//
//  NetworkService.swift
//  Parkology
//

import Foundation

// MARK: - Page param is probably used for pagination -> find this in documentation
struct NetworkService {
    static func getParks(page: Int) async throws -> ParkResponse {
		guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else { return ParkResponse(total: "", limit: "", start: "", data: [])}
		guard let apiKey: String = infoDictionary["API_KEY"] as? String else { return ParkResponse(total: "", limit: "", start: "", data: [])}
        return try await Network.getData(path: "parks", queryItems: [
			"api_key": "jMBaI2955tbErPhY8b6I7fMBmTIb4xUoLP4cMrl3",
            "limit": String(50),
            "start": String(page)
        ])
    }
}
