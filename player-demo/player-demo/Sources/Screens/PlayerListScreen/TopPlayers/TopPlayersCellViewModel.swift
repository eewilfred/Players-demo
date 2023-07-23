//
//  TopPlayersCellViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import Foundation

struct TopPlayersCellViewModel: Hashable {
    var id = UUID()
    var cellViewModels: [PlayerInfoCellViewModel]
    var useCases: PlayerListingUseCaseProtocol
    
    init(from allPayers: [Player], useCases: PlayerListingUseCaseProtocol) {
        self.useCases = useCases
        let sorted = allPayers.sorted(by: {
            Double($0.rating) ?? 0.0 > Double($1.rating) ?? 0.0
        })
        self.cellViewModels = sorted.prefix(upTo: 10).map {
            return PlayerInfoCellViewModel(from: $0, useCases: useCases)
        }
    }
    
    static func == (lhs: TopPlayersCellViewModel, rhs: TopPlayersCellViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
