//
//  SDPark.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftData

@Model
final class SDPark {
	let id: String
	let name: String
	let imageUrl: String?

	init(id: String, name: String, imageUrl: String?) {
		self.id = id
		self.name = name
		self.imageUrl = imageUrl
	}
}
