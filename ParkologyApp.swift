//
//  ParkologyApp.swift
//  Parkology
//

import SwiftUI
import SwiftData

@main
struct ParkologyApp: App {
	var body: some Scene {
		WindowGroup {
			MainView()
				.modelContainer(for: SDPark.self)
		}
	}
}
