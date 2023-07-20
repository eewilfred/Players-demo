//
//  AppFlowCoordinator.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit

final class AppFlowCoordinator: FlowProtocol {

    private let window: UIWindow
            
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let intialFlow = PlayerListingFlowCoordinator(window: window)
        intialFlow.start()
    }
}
