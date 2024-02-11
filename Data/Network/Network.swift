//
//  Network.swift
//  Parkology
//

import Foundation

struct Network {
	static func getData<T: Decodable>(path: String, queryItems: [String : String]) async throws -> T {
		let queryItemsMap: [URLQueryItem] = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
		let (data, response) = try await URLSession.shared.data(for: createRequest(path: path, queryItems: queryItemsMap))

		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw NetworkingError.invalidResponse
		}

		do {
			let decodedData = try JSONDecoder().decode(T.self, from: data)
			return decodedData
		} catch {
			throw NetworkingError.invalidData
		}
	}
	
	private static func createRequest(path: String, queryItems: [URLQueryItem]) throws -> URLRequest {
		guard let url = createUrl(path: path, queryItems: queryItems) else {
			throw NetworkingError.invalidUrl
		}
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = "GET"
		return urlRequest
	}
	
	private static func createUrl(path: String, queryItems: [URLQueryItem]) -> URL? {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "developer.nps.gov"
		components.path = "/api/v1/" + path
		components.queryItems = queryItems
		return components.url
	}
}
