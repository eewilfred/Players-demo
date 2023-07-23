//
//  PlayerEventsView.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerEventsView: View {
    
    @EnvironmentObject var viewModel: PlayerDetailsViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            playerDetailedinformationSectionTitle(title: "Matches")
            ForEach(viewModel.eventsViewModel.eventModels, id: \.self) { sectionModel in
                PlayerEventsViewSection(model: sectionModel)
            }
        }
        .padding(.horizontal, 0)
        .padding(.vertical, 8)
        .frame(alignment: .top)
    }
}

