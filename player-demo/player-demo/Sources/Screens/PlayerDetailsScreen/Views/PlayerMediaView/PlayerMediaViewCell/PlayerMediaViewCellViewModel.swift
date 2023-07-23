//
//  PlayerMediaViewCellViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerMediaViewCellViewModel: Hashable {
    
    nonisolated static func == (lhs: PlayerMediaViewCellViewModel, rhs: PlayerMediaViewCellViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
    }
    
    let id = UUID()
    var imageUrl: String
    var date: String
    var title: String
    var subTitle: String
}
