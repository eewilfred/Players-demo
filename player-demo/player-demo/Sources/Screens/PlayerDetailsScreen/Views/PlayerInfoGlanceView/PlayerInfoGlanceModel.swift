//
//  PlayerInfoGlanceModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerInfoGlanceModel {
    
    var age: String = ""
    var marketPrice: String = ""
    var number: String = ""
    var rating: String = ""
    
    init(viewModel: PlayerDetailsViewModel) {
        
        guard let model = viewModel.details else { return }
        self.age = model.indicatorForKey("Age") ?? ""
        self.marketPrice = model.indicatorForKey("Market price") ?? ""
        self.number = model.indicatorForKey("Player number") ?? ""
        self.rating = model.indicatorForKey("Rating") ?? ""
    }
}
