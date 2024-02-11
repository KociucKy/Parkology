//
//  VisitorsCenter.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

struct VisitorCenter: Codable {
	var id, url, name, parkCode: String
	var description, latitude, longitude, latLong: String
	var audioDescription, isPassportStampLocation, passportStampLocationDescription: String
	var passportStampImages: [Img]
	var geometryPoiID: String
	var amenities: [String]
	var contacts: Contacts
	var directionsInfo, directionsURL: String
	var operatingHours: [OperatingHour]
	var addresses: [Address]
	var images: [Img]
	var lastIndexedDate: String
	var relevanceScore: Int
}

struct Address: Codable {
	var postalCode, city, stateCode, countryCode: String
	var provinceTerritoryCode, line1, type, line3: String
	var line2: String
}

struct Contacts: Codable {
	var phoneNumbers: [PhoneNumber]
	var emailAddresses: [EmailAddress]
}

struct EmailAddress: Codable {
	var description, emailAddress: String
}

struct PhoneNumber: Codable {
	var phoneNumber, description, phoneNumberExtension, type: String

	enum CodingKeys: String, CodingKey {
		case phoneNumber, description
		case phoneNumberExtension = "extension"
		case type
	}
}

struct Img: Codable {
	var credit: String
	var title, altText, caption: String
	var url: String
}

struct OperatingHour: Codable {
	var exceptions: [Exception]
	var description: String
	var standardHours: Hours
	var name: String
}

struct Exception: Codable {
	var exceptionHours: Hours
	var startDate, name, endDate: String
}

struct Hours: Codable {
	var wednesday, monday, thursday, sunday: String
	var tuesday, friday, saturday: String
}
