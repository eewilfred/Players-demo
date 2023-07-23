//
//  TeamInfoView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

@MainActor struct TeamInfoViewViewModel {
    
    var teamLogoUrl: String = ""
    var teamName: String = ""
    var playerCountry: String = ""
    
    init(viewModel: PlayerDetailsViewModel) {
        
        guard let model = viewModel.details else { return }
        
        self.teamLogoUrl = model.teamPhoto
        self.teamName = model.teamName
        self.playerCountry = model.playerCountry
    }
}

@MainActor struct TeamInfoView: View {
    
    var model: TeamInfoViewViewModel
    
    init(viewModel: PlayerDetailsViewModel) {
        self.model = TeamInfoViewViewModel(viewModel: viewModel)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            asyncImage(url: model.teamLogoUrl,
                       width: 48,
                       height: 48
            )
            VStack(alignment: .leading, spacing: 0) {
                // Light 28
                Text(model.teamName)
                    .font(
                        Font.custom("SF Pro", size: 28)
                            .weight(.light)
                    )
                    .foregroundColor(Color("Grey Dark"))
                // SemiBold 15
                Text(model.playerCountry)
                    .font(
                        Font.custom("SF Pro", size: 15)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color("Grey03"))
            }
        }
    }
}

struct asyncImage: View {
    
    var url: String
    var width: CGFloat?
    var height: CGFloat?
    
    init(url: String, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.url = url
        self.width = width
        self.height = height
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
                    .tint(Color("Primery"))
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:width, height: height)
            case .failure:
                Image(systemName:"photo")
            @unknown default:
                // as AsyncImagePhase enum is not frozen
                EmptyView()
            }
        }
    }
}
