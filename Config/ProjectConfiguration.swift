//
//  ProjectConfiguration.swift
//  Parkology
//
//  Created by Kuba Kociucki on 08/02/2024.
//

import Foundation

struct ProjectConfiguration {
	enum ConfigurationError: Error {
		case missingKey, invalidValue
	}

	static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
		guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
			throw ConfigurationError.missingKey
		}

		switch object {
		case let value as T:
			return value
		case let string as String:
			guard let value = T(string) else { fallthrough }
			return value
		default:
			throw ConfigurationError.invalidValue
		}
	}
}
