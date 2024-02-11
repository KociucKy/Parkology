//
//  ParkologyApp.swift
//  Parkology
//

import SwiftUI
import SwiftData

@main
struct ParkologyApp: App {
	@State private var networkMonitor = NetworkMonitor()

	var body: some Scene {
		WindowGroup {
			MainView()
				.modelContainer(for: SDPark.self)
				.environmentObject(networkMonitor)
		}
	}
}
