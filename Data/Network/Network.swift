//
//  Network.swift
//  Parkology
//

import Foundation

struct Network {
    static func getData(path: String, queryItems: [String : String]) async throws -> ParkResponse {
        let queryItemsMap: [URLQueryItem] = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        let (data, _) = try await URLSession.shared.data(for: createRequest(path: path, queryItems: queryItemsMap))
        return try! JSONDecoder().decode(ParkResponse.self, from: data)
    }

    private static func createRequest(path: String, queryItems: [URLQueryItem]) -> URLRequest {
        var urlRequest = URLRequest(url: createUrl(path: path, queryItems: queryItems))
        urlRequest.httpMethod = "GET"
        return urlRequest
    }

    private static func createUrl(path: String, queryItems: [URLQueryItem]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "developer.nps.gov"
        components.path = "/api/v1/" + path
        components.queryItems = queryItems
        return components.url!
    }
}
