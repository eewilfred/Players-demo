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
                Text(model.teamName)
                    .FontSFPro(28, .light, Color("Grey Dark"))
                Text(model.playerCountry)
                    .FontSFPro(15, .semibold, Color("Grey03"))
            }
        }
    }
}

struct asyncImage: View {
    
    var url: String
    var contentMode: ContentMode
    var width: CGFloat?
    var height: CGFloat?
    
    init(url: String, width: CGFloat? = nil, height: CGFloat? = nil, contentMode: ContentMode = .fit) {
        self.url = url
        self.width = width
        self.height = height
        self.contentMode = contentMode
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
                    .aspectRatio(contentMode: contentMode)
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
