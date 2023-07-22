//
//  TopPlayersCellViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import Foundation

struct TopPlayersCellViewModel: Hashable {

    var id = UUID()
    var topPlayers: [PlayerInfoCellViewModel]
    
    init(from allPayers: [Player]) {
        let sorted = allPayers.sorted(by: {
            Double($0.rating) ?? 0.0 > Double($1.rating) ?? 0.0
        })
        self.topPlayers = sorted.prefix(upTo: 10).map {
            PlayerInfoCellViewModel(from: $0)
         }
    }
}
