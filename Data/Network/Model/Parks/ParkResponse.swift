//
//  ParkResponse.swift
//  Parkology
//

import Foundation

struct ParkResponse: Codable {
    var total: String
    var limit: String
    var start: String
	var data: [Park]
}
