//
//  PlayerMediaView.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI


@MainActor struct PlayerMediaView: View {
    @EnvironmentObject var viewModel: PlayerDetailsViewModel
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 12) {
            playerDetailedinformationSectionTitle(title: "Media")
            ForEach(viewModel.mediaViewModel.cellModels, id: \.id) { model in
                PlayerMediaViewCell(model: model)
            }
        }
        .padding(12)
        
    }
}
