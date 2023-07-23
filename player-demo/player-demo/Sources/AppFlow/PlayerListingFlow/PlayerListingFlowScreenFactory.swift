//
//  PlayerListingFlowScreenFactory.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit
import SwiftUI

final class PlayerListingFlowScreenFactory {
    
    func getPlayerListingScreen(flowController: PlayerListingFlowProtocol, useCase: PlayerListingUseCaseProtocol) -> PlayerListViewController {
        return PlayerListViewController(
            viewModel: PlayerListViewModel(flowController: flowController, useCase: useCase)
        )
    }
    
    @MainActor func getPlayerDetailsScreen(for slug: String, useCase: PlayerListingUseCaseProtocol) -> UIHostingController<PlayerDetailsView> {
        
        let PlayerDetailsSwiftUiView = PlayerDetailsView(viewModel: PlayerDetailsViewModel(slug: slug, useCase: useCase))
        return UIHostingController(rootView: PlayerDetailsSwiftUiView)
    }
}
