//
//  ParksView.swift
//  Parkology
//

import SwiftUI

struct ParksView: View {
    @State var viewModel: ParksViewModel = ParksViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(viewModel.parks) { park in
                        NavigationLink(value: park) {
                            ParkRowView(park: park)
                                .onAppear {
                                    viewModel.loadMore(park)
                                }
                        }
                    }
                }
                .padding(8)
            }
            .task {
                try! await viewModel.getData()
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
