//
//  PlayerListingFlowCoordinator.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit

final class PlayerListingFlowCoordinator: PlayerListingFlowProtocol {
    
    private let window: UIWindow
    private let screenFactory = PlayerListingFlowScreenFactory()
    private var rootVC: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showPlayerListingHomeScreen() {
        
        let playerListVC = screenFactory.getPlayerListingScreen(flowController: self)
        let rootNavVC = UINavigationController(rootViewController: playerListVC)
        window.rootViewController = rootNavVC
        self.rootVC = rootNavVC
    }
    
    @MainActor func showPlayerDetailsScreen(for slug: String) {
        let detailsVc = screenFactory.getPlayerDetailsScreen(for: slug)
        detailsVc.modalPresentationStyle = .fullScreen
        rootVC?.pushViewController(detailsVc, animated: true)
    }
    
    func start() {
        showPlayerListingHomeScreen()
    }
}
