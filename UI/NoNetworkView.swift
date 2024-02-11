//
//  NoNetworkView.swift
//  Parkology
//
//  Created by Kuba Kociucki on 11/02/2024.
//

import SwiftUI

struct NoNetworkView: View {
	var body: some View {
		ContentUnavailableView("Network connection seems to be offline. Please check your connectivity", systemImage: "wifi.slash")
	}
}

#Preview {
	NoNetworkView()
}
