//
//  NetworkingError.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

enum NetworkingError: Error, Equatable {
	static func == (lhs: NetworkingError, rhs: NetworkingError) -> Bool {
		lhs.errorDescription == rhs.errorDescription
	}
	
	case invalidUrl
	case invalidResponse
	case invalidData
	case unknown(Error)

	var errorDescription: String? {
		switch self {
		case .invalidUrl:
			return "The URL was invalid. Please try again later."
		case .invalidResponse:
			return "There was an error with the server. Please try again later."
		case .invalidData:
			return "The data is invalid. Please try again later."
		case .unknown(let error):
			return error.localizedDescription
		}
	}
}
