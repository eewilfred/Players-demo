//
//  PlayerListingFlowScreenFactory.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit

final class PlayerListingFlowScreenFactory {
    
    func getPlayerListingScreen() -> PlayerListViewController {
        let vc = PlayerListViewController(viewModel: PlayerListViewModel())
        vc.view.backgroundColor = .blue
        return vc
    }
    
    func getPlayerDetailsScreen(for slug: String) {
        
    }
}
