//
//  Park.swift
//  Parkology
//

import Foundation

struct Park: Codable, Identifiable, Hashable {
    static func == (lhs: Park, rhs: Park) -> Bool {
        lhs.id == rhs.id
    }
    
    var activities: [Activity]
    var addresses: [Address]
    var contacts: Contact
    var description: String
    var designation: String
    var directionsInfo: String
    var directionsUrl: String
    var entranceFees: [EntranceFee]
    var entrancePasses: [EntrancePass]
    var fullName: String
    var id: String
    var images: [Img]
    var latLong: String
    var name: String
    var operatingHours: [OperatingHours]
    var parkCode: String
    var relevanceScore: Int
    var states: String
    var topics: [Topic]
    var url: String
    var weatherInfo: String

    struct Activity: Codable, Hashable {
        var id: String
        var name: String
    }

    struct Address: Codable, Hashable {
        var line1: String
        var line2: String
        var line3: String
        var city: String
        var stateCode: String
        var countryCode: String
        var provinceTerritoryCode: String
        var postalCode: String
        var type: String
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

    struct EntranceFee: Codable, Hashable {
        var cost: String
        var description: String
        var title: String
    }

    struct EntrancePass: Codable, Hashable {
        var cost: String
        var description: String
        var title: String
    }

    struct Img: Codable, Hashable {
        var credit: String
        var altText: String
        var title: String
        var caption: String
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

    struct Topic: Codable, Hashable {
        var id: String
        var name: String
    }
}

extension Park {
    static let preview: Park = Park(activities: [], addresses: [], contacts: .init(phoneNumbers: [], emailAddresses: []), description: "This is sample park", designation: "", directionsInfo: "", directionsUrl: "", entranceFees: [], entrancePasses: [], fullName: "Amazing Park in the Amazing Place", id: "0", images: [.init(credit: "", altText: "", title: "", caption: "", url: "https://www.nps.gov/common/uploads/structured_data/3C861078-1DD8-B71B-0B774A242EF6A706.jpg")], latLong: "0.00", name: "Amazing Place", operatingHours: [], parkCode: "park", relevanceScore: 5, states: "ca", topics: [], url: "", weatherInfo: "")
}
