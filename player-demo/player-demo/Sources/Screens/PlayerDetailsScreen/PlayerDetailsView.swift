//
//  PlayerDetailsView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

@MainActor class PlayerDetailsViewModel: ObservableObject {
    
    @Published var details: PlayerDetails?
    var slug: String
    
    init(slug: String) {
        self.slug = slug
    }
}


struct PlayerDetailsView: View {
    
    @StateObject var viewModel:  PlayerDetailsViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlayerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailsView(viewModel: PlayerDetailsViewModel(slug: "hyz"))
    }
}
