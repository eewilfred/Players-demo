//
//  PlayerInformationView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

@MainActor struct PlayerInformationViewModel {
    
    var playername: String = ""
    var mainPostion: String = ""
    var playerImage: String = ""
    
    init(viewModel: PlayerDetailsViewModel) {
        
        guard let model = viewModel.details else { return }
        
        playername = model.playerName
        playerImage = model.playerPhoto
        mainPostion = model.indicatorForKey("Main position") ?? ""
    }
}

@MainActor struct PlayerInformationView: View {
    
    @State var model: PlayerInformationViewModel
    
    init(model: PlayerDetailsViewModel) {
        self.model = PlayerInformationViewModel(viewModel: model)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                VStack(spacing: 0) {
                    HStack {
                        Text(model.playername)
                            .font(
                                Font.custom("SF Pro", size: 34)
                                    .weight(.thin)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                    .background(Color("Primery"))
                    Text(model.mainPostion)
                        .font(
                            Font.custom("SF Pro", size: 15)
                                .weight(.semibold)
                        )
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color("Primery"))
                    Color("Primery")
                        .background(Color("Primery"))
                        .frame(height: 50)
                }
            }
            asyncImage(url: model.playerImage, width: 168, height: 168)
                .cornerRadius(25)
                .offset(y: 64)
        }
    }
}
