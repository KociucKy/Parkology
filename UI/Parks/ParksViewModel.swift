//
//  ParksViewModel.swift
//  Parkology
//

import Foundation

@Observable
class ParksViewModel {
    private(set) var parks: [Park] = []

    @ObservationIgnored
    private var repository: ParkRepository = ParkRepository()
    @ObservationIgnored
    private var currentPage: Int = 0

    func getData() async throws {
        parks = try await repository.getParks().data
    }

    func loadMore(_ park: Park) {
        Task {
            if park.id == parks.last!.id {
                parks = try! await repository.getParks(page: currentPage).data
                currentPage += 1
            }
        }
    }
}
