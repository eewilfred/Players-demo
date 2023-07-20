//
//  PlayerListingFlowProtocol.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import Foundation

protocol PlayerListingFlowProtocol: FlowProtocol {
    
    func showPlayerListingHomeScreen()
    
    func showPlayerDetailsScreen(for slug: String)
}
