//
//  PlayerEventsViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import Foundation

@MainActor struct PlayerEventsViewModel {
    
    var eventModels: [PlayerEventSectionViewModel] = []
    
    init(viewModel: PlayerDetailsViewModel) {
        guard let details = viewModel.details else { return }
        
        self.eventModels = details.events.map({
            PlayerEventSectionViewModel(
                leagueName: $0.leagueName,
                leagueLogo: $0.leagueLogo,
                matches: $0.matches)
        })
    }
}
