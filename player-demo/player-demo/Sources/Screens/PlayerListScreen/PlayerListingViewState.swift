//
//  PlayerListingViewState.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import Combine


enum PlayerListingViewState {
    
    case loading
    case failed
    case success([PlayerListRows])
    case noIteamsFoundOnSearch
}
