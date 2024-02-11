//
//  Keys.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import Foundation

struct Keys {
	static func getApiKey() -> String {
		guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else { return ""}
		guard let apiKey: String = infoDictionary["API_KEY"] as? String else { return ""}
		return apiKey
	}
}
