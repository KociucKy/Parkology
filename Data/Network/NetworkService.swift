//
//  NetworkService.swift
//  Parkology
//

import Foundation

struct NetworkService {
	static func getParks(startFrom: Int) async throws -> ParkResponse {
		//		guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else { return ParkResponse(total: "", limit: "", start: "", data: [])}
		//		guard let apiKey: String = infoDictionary["API_KEY"] as? String else { return ParkResponse(total: "", limit: "", start: "", data: [])}
		return try await Network.getData(path: "parks", queryItems: [
			"api_key": "jMBaI2955tbErPhY8b6I7fMBmTIb4xUoLP4cMrl3",
			"limit": String(20),
			"start": String(startFrom)
		])
	}

	static func getCenters(startFrom: Int) async throws -> VisitorsCenterResponse {
		return try await Network.getData(path: "visitorcenters", queryItems: [
			"api_key": "jMBaI2955tbErPhY8b6I7fMBmTIb4xUoLP4cMrl3",
			"limit": String(20),
			"start": String(startFrom)
		])
	}
}
