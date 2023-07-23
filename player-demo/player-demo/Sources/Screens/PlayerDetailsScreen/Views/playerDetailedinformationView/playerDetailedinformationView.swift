//
//  playerDetailedinformationView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

//MARK: - playerDetailedinformationView

@MainActor struct playerDetailedinformationView: View {
    
    let model: playerDetailedinformationViewModel
    
    init(viewModel: PlayerDetailsViewModel) {
        self.model = playerDetailedinformationViewModel(viewModel: viewModel)
    }
    
    var body: some View {
        
        LazyVStack(alignment: .center, spacing: 15) {
            
            playerDetailedinformationSectionTitle(title: "About Player")
            
            playerDetailedinformationViewSection(discription: model.about, information: model.aboutPlayer)
            
            playerDetailedinformationSectionTitle(title: "Ratings")
                .padding(.top, 3)
                .padding(.bottom, 3)
            
            playerDetailedinformationViewSection(discription: nil, information: model.ratings)
            
        }
        .padding(.horizontal, 9)
        .padding(.vertical, 8)
    }
}
