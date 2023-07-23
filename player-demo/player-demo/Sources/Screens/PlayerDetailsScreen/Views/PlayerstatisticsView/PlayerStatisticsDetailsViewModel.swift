//
//  PlayerStatisticsDetailsViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerStatisticsDetailsViewModel {
    
    var statistics: [PlayerStatisticsDetailsSectionViewModel]
    
    init(statistic: Statistic) {
        self.statistics = statistic.data.map({
            PlayerStatisticsDetailsSectionViewModel($0)
        })
    }
}

@MainActor struct PlayerStatisticsDetailsSectionViewModel: Hashable {
    
    nonisolated static func == (lhs: PlayerStatisticsDetailsSectionViewModel, rhs: PlayerStatisticsDetailsSectionViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    let id = UUID()
    var section: Section
    var data: [Indicator]
    
    func getIndicatorValueForKey(_ key: String) -> String? {
        let value = data.first(where: {
            $0.key == key
        })?.value
        return value?.replacingOccurrences(of: ",", with: ".")
    }
    
    init(_ statistic: StatisticData) {
        self.data = statistic.data
        self.section = statistic.section
    }
}
