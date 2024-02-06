//
//  ParkResponse.swift
//  Parkology
//

import Foundation

struct ParkResponse: Codable {
    var total: String
    var data: [Park]
    var limit: String
    var start: String
}
