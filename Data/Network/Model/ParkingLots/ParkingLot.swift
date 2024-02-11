//
//  ParkingLot.swift
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

struct ParkingLot: Codable, Identifiable, Hashable {
	static func == (lhs: ParkingLot, rhs: ParkingLot) -> Bool {
		lhs.id == rhs.id
	}
	
	var id, name, altName, description: String
	var relatedParks: [RelatedPark]
	var latitude, longitude: Double
	var geometryPoiId, managedByOrganization, timeZone, webcamUrl: String
	var contacts: Contact
	var fees: [Fee]
	var operatingHours: [OperatingHours]
	var images: [Img]
	var accessibility: Accessibility
	var liveStatus: LiveStatus

	struct Accessibility: Codable, Hashable {
		var isLotAccessibleToDisabled: Bool
		var totalSpaces, numberofAdaSpaces, numberofAdaVanAccessbileSpaces, numberofAdaStepFreeSpaces: Int
		var numberOfOversizeVehicleSpaces: Int
		var adaFacilitiesDescription: String
	}

	struct Contact: Codable, Hashable {
		var phoneNumbers: [PhoneNumber]
		var emailAddresses: [EmailAddres]

		struct PhoneNumber: Codable, Hashable {
			var description: String
			var `extension`: String
			var type: String
		}

		struct EmailAddres: Codable, Hashable {
			var emailAddress: String
			var description: String
		}
	}

	struct Fee: Codable, Hashable {
		var cost, description, title: String
	}

	struct Img: Codable, Hashable {
		var credit: String
		var title, altText, caption: String
		var url: String
	}

	struct LiveStatus: Codable, Hashable {
		var isActive: Bool
		var occupancy: String
		var estimatedWaitTimeInMinutes: Int?
		var description, expirationDate: String
	}

	struct OperatingHours: Codable, Hashable {
			var name: String
			var description: String
			var standardHours: StandardHours
			var exceptions: [Exceptions]

			struct StandardHours: Codable, Hashable {
				var sunday: String
				var monday: String
				var tuesday: String
				var wednesday: String
				var thursday: String
				var friday: String
				var saturday: String
			}

			struct Exceptions: Codable, Hashable {
				var name: String
				var startDate: String
				var endDate: String
			}
		}

	enum Day: String, Codable, Hashable{
		case allDay = "All Day"
		case closed = "Closed"
	}

	struct RelatedPark: Codable, Hashable {
		var states, parkCode, designation, fullName: String
		var url: String
		var name: String
	}

}

