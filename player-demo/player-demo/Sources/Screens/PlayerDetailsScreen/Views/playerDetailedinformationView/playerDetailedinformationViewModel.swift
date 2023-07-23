//
//  playerDetailedinformationViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

//MARK: - playerDetailedinformationViewModel

@MainActor struct playerDetailedinformationViewModel {
    
    var aboutPlayer: [Indicator] = []
    var ratings: [Indicator] = []
    var about: String = ""
    
    init(viewModel: PlayerDetailsViewModel) {
        guard let model = viewModel.details else { return }
        
        self.aboutPlayer = model.indicators
        self.ratings = model.rating
        self.about = model.about
    }
}
