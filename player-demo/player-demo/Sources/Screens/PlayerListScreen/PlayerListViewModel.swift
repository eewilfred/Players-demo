//
//  PlayerListViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import Combine

class PlayerListViewModel {
    
    private var state = PassthroughSubject<PlayerListingViewState,Never>()
    private var cancellables: [AnyCancellable] = []
    private let useCase =  PlayerListingUseCase(networkService: NetworkService())
    
    private var players: [Player] = [] // for search with out using network.
    
    
    func setupBindings(selection: PassthroughSubject<String, Never>,
                       search:PassthroughSubject<String, Never>
    ) -> PassthroughSubject<PlayerListingViewState,Never> {
        
        // Mark: Selection
        selection
            .sink { slug in
                //TODO: navigate to details page
                print("selected")
            }
            .store(in: &cancellables)
        
        //Mark: Handling search
        
        // Add a delay to avaid screen flikering
        search
            .debounce(for: .milliseconds(500), scheduler: Scheduler.mainTaskScheduler)
            .sink { [unowned self] value in
                guard !value.isEmpty else {
                    state.send(.success(players))
                    return
                }
                let lowerValue = value.lowercased()
                let result = players.filter { player in
                    player.name.lowercased().contains(lowerValue) || player.nameShort.contains(lowerValue)
                }
                if result.isEmpty {
                    state.send(.noIteamsFoundOnSearch)
                } else {
                    state.send(.success(result))
                }
            }
            .store(in: &cancellables)
        
        useCase.getAllPlayers()
            .sink {[weak self] result in
                // set as week to handle case if if this screen is not Home page
                guard let self = self else { return }
                if let players = try? result.get().data,
                   !players.isEmpty {
                    self.players = players
                    state.send(.success(players))
                } else {
                    state.send(.failed)
                }
        }
        .store(in: &cancellables)
    
        
        
        return state
    }
    
}
