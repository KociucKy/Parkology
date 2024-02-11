//
//  ParksView.swift
//  Parkology
//

import SwiftUI

// TODO: - Add empty state
struct ParksView: View {
	@State private var viewModel: ParksViewModel = ParksViewModel()
	@State private var showError: Bool = false
	
	var body: some View {
		NavigationStack {
			Group {
				if !viewModel.parks.isEmpty {
					ScrollView {
						LazyVStack(spacing: 8) {
							ForEach(viewModel.parks, id: \.id) { park in
								NavigationLink(value: park) {
									ParkRowView(park: park)
										.onAppear {
											if park.id == viewModel.parks.last!.id {
												viewModel.loadMore()
											}
										}
								}
							}
						}
						.padding(8)
					}
				} else {
					ProgressView("Loading data")
				}
			}
			.task {
				try? await viewModel.getData()
			}
			.navigationDestination(for: Park.self) { park in
				ParkDetailsView(park: park)
			}
			.onChange(of: viewModel.error) { _, newValue in
				if newValue != nil {
					showError = true
				}
			}
			.alert("Something went wrong", isPresented: $showError) {
				Button("Try again") {
					showError = false
					Task {
						try? await viewModel.getData()
					}
				}
			} message: {
				Text(viewModel.error?.errorDescription ?? "")
			}

		}
	}
}

#Preview {
	ParksView()
}
