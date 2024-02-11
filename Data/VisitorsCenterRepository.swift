//
//  VisitorsCenterRepository.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

struct VisitorsCenterRepository {
	func getCenters(startFrom: Int = 0) async throws -> VisitorsCenterResponse {
		try await NetworkService.getCenters(startFrom: startFrom)
	}
}
