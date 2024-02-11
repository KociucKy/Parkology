//
//  ParksView.swift
//  Parkology
//

import SwiftUI

// TODO: - Add empty state
struct ParksView: View {
	@State var viewModel: ParksViewModel = ParksViewModel()
	
	var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack(spacing: 8) {
					ForEach(viewModel.parks, id: \.id) { park in
						NavigationLink(value: park) {
							ParkRowView(park: park)
								.onAppear {
									if park.id == viewModel.parks.last!.id {
										viewModel.loadMore(park)
									}
								}
						}
					}
				}
				.padding(8)
			}
			.task {
				// TODO: - Handle try statement
				do {
					try await viewModel.getData()
				} catch {
					print(error)
				}
			}
			.navigationDestination(for: Park.self) { park in
				ParkDetailsWrapper(park: park)
					.navigationTitle(park.name)
			}
		}
	}
}

#Preview {
	ParksView()
}
