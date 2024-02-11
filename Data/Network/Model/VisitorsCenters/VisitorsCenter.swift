//
//  VisitorsCenter.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

struct VisitorCenter: Codable, Identifiable, Hashable {
	static func == (lhs: VisitorCenter, rhs: VisitorCenter) -> Bool {
		lhs.id == rhs.id
	}

	var id, url, name, parkCode: String
	var description, latitude, longitude, latLong: String
	var audioDescription, isPassportStampLocation, passportStampLocationDescription: String
	var passportStampImages: [Img]
	var geometryPoiId: String
	var amenities: [String]
	var contacts: Contacts
	var directionsInfo, directionsUrl: String
	var operatingHours: [OperatingHours]
	var addresses: [Address]
	var images: [Img]
	var lastIndexedDate: String
	var relevanceScore: Int


	struct Address: Codable, Hashable {
		var postalCode, city, stateCode, countryCode: String
		var provinceTerritoryCode, line1, type, line3: String
		var line2: String
	}

	struct Contacts: Codable, Hashable {
		var phoneNumbers: [PhoneNumber]
		var emailAddresses: [EmailAddress]
	}

	struct EmailAddress: Codable, Hashable {
		var description, emailAddress: String
	}

	struct PhoneNumber: Codable, Hashable {
		var phoneNumber, description, phoneNumberExtension, type: String

		enum CodingKeys: String, CodingKey {
			case phoneNumber, description
			case phoneNumberExtension = "extension"
			case type
		}
	}

	struct Img: Codable, Hashable {
		var credit: String
		var title, altText, caption: String
		var url: String
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
}

extension VisitorCenter {
	static let previews: VisitorCenter = VisitorCenter(
		id: "123",
		url: "",
		name: "Example Visitor Center",
		parkCode: "",
		description: "This is very cool visitor center, you should check it out",
		latitude: "",
		longitude: "",
		latLong: "",
		audioDescription: "",
		isPassportStampLocation: "",
		passportStampLocationDescription: "",
		passportStampImages: [],
		geometryPoiId: "",
		amenities: [],
		contacts: Contacts(phoneNumbers: [], emailAddresses: []),
		directionsInfo: "",
		directionsUrl: "",
		operatingHours: [],
		addresses: [],
		images: [
			.init(credit: "", title: "", altText: "", caption: "", url: "https://www.nps.gov/common/uploads/structured_data/9568A7E6-AEA4-9A20-B64A77235A9F4277.jpg")
		],
		lastIndexedDate: "",
		relevanceScore: 0
	)
}
