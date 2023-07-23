//
//  PlayerEventSectionViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import Foundation

@MainActor struct PlayerEventSectionViewModel: Hashable {
    
    let id = UUID()
    nonisolated static func == (lhs: PlayerEventSectionViewModel, rhs: PlayerEventSectionViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
    }
    
    let leagueName: String
    let leagueLogo: String
    let matches: [Match]
}
