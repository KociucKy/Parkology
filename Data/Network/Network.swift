//
//  Network.swift
//  Parkology
//

import Foundation

// TODO: - Add APIKey to xcconfig file
// TODO: - Create an custom Error enum (cases for invalid URL, invalid response, invalid data and other error)
// TODO: - Handle errors with poor or no Internet connection
struct Network {
    static func getData(path: String, queryItems: [String : String]) async throws -> ParkResponse {
		// TODO: - Handle all try statements with do-catch blocks
        let queryItemsMap: [URLQueryItem] = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
		// TODO: - Handle not only data but response too
        let (data, _) = try await URLSession.shared.data(for: createRequest(path: path, queryItems: queryItemsMap))
        return try JSONDecoder().decode(ParkResponse.self, from: data)
    }

    private static func createRequest(path: String, queryItems: [URLQueryItem]) -> URLRequest {
        var urlRequest = URLRequest(url: createUrl(path: path, queryItems: queryItems))
        urlRequest.httpMethod = "GET"
        return urlRequest
    }

    private static func createUrl(path: String, queryItems: [URLQueryItem]) -> URL {
		// TODO: - Return optional URL and than unwrap when needed
        var components = URLComponents()
        components.scheme = "https"
        components.host = "developer.nps.gov"
		// TODO: - Add APIKey parameter to path OR to HTTP header (research)
		components.path = "/api/v1/" + path
        components.queryItems = queryItems
		print("🔔 URL: \(String(describing: components.url?.absoluteString))")
        return components.url!
    }
}
