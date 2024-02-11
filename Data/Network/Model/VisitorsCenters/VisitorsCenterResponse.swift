//
//  VisitorsCenterResponse.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

struct VisitorsCenterResponse: Codable {
	var total: String
	var data: [VisitorCenter]
	var limit, start: String
}
