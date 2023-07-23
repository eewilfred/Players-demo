//
//  PlayerMediaViewViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerMediaViewViewModel {
    
    var cellModels: [PlayerMediaViewCellViewModel] = []
    
    init(viewModel: PlayerDetailsViewModel) {
        guard let model = viewModel.details else { return }
        
        self.cellModels = model.medias.map({
            PlayerMediaViewCellViewModel(
                imageUrl: $0.preview,
                date: $0.date.convertToAppDateFormat() ?? "",
                title: $0.title,
                subTitle: $0.subtitle
            )
        })
    }
}
