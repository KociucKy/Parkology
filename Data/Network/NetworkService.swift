//
//  NetworkService.swift
//  Parkology
//

import Foundation

struct NetworkService {
    static func getParks(page: Int) async throws -> ParkResponse {
        try await Network.getData(path: "parks", queryItems: [
            "limit": String(20),
            "page": String(page)
        ])
    }
}
