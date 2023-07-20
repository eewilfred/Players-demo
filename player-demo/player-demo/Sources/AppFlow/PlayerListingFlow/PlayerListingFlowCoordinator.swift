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
        
        let playerListVC = screenFactory.getPlayerListingScreen()
        let rootNavVC = UINavigationController(rootViewController: playerListVC)
        window.rootViewController = rootNavVC
        self.rootVC = rootNavVC
    }
    
    func showPlayerDetailsScreen(for slug: String) {
    }
    
    func start() {
        showPlayerListingHomeScreen()
    }
}
