//
//  PlayerInfoUseCase.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit
import Combine

// Adding protocol for unit testablilty
protocol PlayerInfoUseCaseProtocol {

    // Note: For now Infinite Load and Paginations are not considered as its not in requirements.
    /// Get all Players
    func getAllPlayers() -> AnyPublisher<Result<Players, Error>, Never>

    /// Get Player Details
    func getPlayerDetail(slug: String) -> AnyPublisher<Result<PlayerDetails, Error>, Never>

    // Loads image
    func loadImage(from urlString: String) -> AnyPublisher<UIImage?, Never>
}

final class PlayerInfoUseCase: PlayerInfoUseCaseProtocol {
    
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getAllPlayers() -> AnyPublisher<Result<Players, Error>, Never> {
        return networkService
            .load(Resource<Players>.allPlayers())
            .map { .success($0) }
            .catch { error -> AnyPublisher<Result<Players, Error>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundTaskScheduler)
            .receive(on: Scheduler.mainTaskScheduler)
            .eraseToAnyPublisher()
    }
    
    func getPlayerDetail(slug: String) -> AnyPublisher<Result<PlayerDetails, Error>, Never> {
        return networkService
            .load(Resource<PlayerDetails>.details(slug: slug))
            .map { .success($0.data) }
            .catch { error -> AnyPublisher<Result<PlayerDetails, Error>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundTaskScheduler)
            .receive(on: Scheduler.mainTaskScheduler)
            .eraseToAnyPublisher()
    }
    
    func loadImage(from urlString: String) -> AnyPublisher<UIImage?, Never> {
        //TODO: get images
        return Just(nil).eraseToAnyPublisher()
    }
    
    
}
