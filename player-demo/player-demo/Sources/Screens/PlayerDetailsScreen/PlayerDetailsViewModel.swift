//
//  PlayerDetailsViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI
import Combine

@MainActor class PlayerDetailsViewModel: ObservableObject {
    
    @Published var details: PlayerDetails?
    @Published var hasError: Bool = false
    @Published var isLoading: Bool = true
    
    private var cancellables: [AnyCancellable] = []
    
    
    var slug: String
    private let useCase =  PlayerListingUseCase(networkService: NetworkService())
    
    init(slug: String) {
        self.slug = slug
        useCase.getPlayerDetail(slug: slug)
            .sink { [weak self] result in
                guard let self = self else { return }
                if let playerDetails = try? result.get() {
                    details = playerDetails
                } else {
                    hasError = true
                }
                self.isLoading = false
            }
            .store(in: &cancellables)
    }
}
