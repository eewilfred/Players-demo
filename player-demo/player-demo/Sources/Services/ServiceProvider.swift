//
//  ServiceProvider.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import Foundation

class ServiceProvider {
    let networkService: NetworkServiceProtocol
    
    init() {
        self.networkService = NetworkService()
    }
}
