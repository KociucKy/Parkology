//
//  NetworkService.swift
//  Parkology
//

import Foundation

struct NetworkService {


	static func getParks(startFrom: Int) async throws -> ParkResponse {
		return try await Network.getData(path: "parks", queryItems: [
			"api_key": Keys.getApiKey(),
			"limit": String(20),
			"start": String(startFrom)
		])
	}

	static func getCenters(for parkId: String, startFrom: Int) async throws -> VisitorsCenterResponse {
		return try await Network.getData(path: "visitorcenters", queryItems: [
			"api_key": Keys.getApiKey(),
			"limit": String(20),
			"start": String(startFrom),
			"parkCode": parkId
		])
	}

	static func getParkingLots(for parkId: String, startFrom: Int) async throws -> ParkingLotResponse {
		return try await Network.getData(path: "parkinglots", queryItems: [
			"api_key": Keys.getApiKey(),
			"limit": String(20),
			"start": String(startFrom),
			"parkCode": parkId
		])
	}
}
