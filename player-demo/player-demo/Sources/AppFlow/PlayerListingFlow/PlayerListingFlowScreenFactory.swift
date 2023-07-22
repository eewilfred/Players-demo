//
//  PlayerListingFlowScreenFactory.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit
import SwiftUI

final class PlayerListingFlowScreenFactory {
    
    func getPlayerListingScreen(flowController: PlayerListingFlowProtocol) -> PlayerListViewController {
        return PlayerListViewController(
            viewModel: PlayerListViewModel(flowController: flowController)
        )
    }
    
    @MainActor func getPlayerDetailsScreen(for slug: String) -> UIHostingController<PlayerDetailsView> {
        
        let PlayerDetailsSwiftUiView = PlayerDetailsView(viewModel: PlayerDetailsViewModel(slug: slug))
        return UIHostingController(rootView: PlayerDetailsSwiftUiView)
    }
}
