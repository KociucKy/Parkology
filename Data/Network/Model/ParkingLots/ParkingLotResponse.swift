//
//  ParkingLotResponse.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

struct ParkingLotResponse: Codable {
	var total: String
	var data: [ParkingLot]
	var limit, start: String
}
