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
    
    private var flowController: PlayerListingFlowProtocol
    
    init(flowController: PlayerListingFlowProtocol) {
        self.flowController = flowController
    }
    
    
    func setupBindings(selection: PassthroughSubject<String, Never>,
                       search:PassthroughSubject<String, Never>
    ) -> PassthroughSubject<PlayerListingViewState,Never> {
        
        // MARK: Selection
        selection
            .sink { slug in
                //TODO: navigate to details page
                self.flowController.showPlayerDetailsScreen(for: slug)
            }
            .store(in: &cancellables)
        
        //MARK: Handling search
        
        // Add a delay to avaid screen flikering
        search
            .debounce(for: .milliseconds(500), scheduler: Scheduler.mainTaskScheduler)
            .sink { [unowned self] value in
                guard !value.isEmpty else {
                    self.notifyPlayerListupdate(self.players)
                    return
                }
                let lowerValue = value.lowercased()
                let result = players.filter { player in
                    player.name.lowercased().contains(lowerValue) || player.nameShort.contains(lowerValue)
                }
                if result.isEmpty {
                    state.send(.noIteamsFoundOnSearch)
                } else {
                    self.notifyPlayerListupdate(result)
                }
            }
            .store(in: &cancellables)
        
        // MARK: Intial update
        useCase.getAllPlayers()
            .sink {[weak self] result in
                // set as week to handle case if if this screen is not Home page
                guard let self = self else { return }
                if let players = try? result.get().data,
                   !players.isEmpty {
                    self.players = players
                    self.notifyPlayerListupdate(players)
                } else {
                    state.send(.failed)
                }
            }
            .store(in: &cancellables)
        
        
        
        return state
    }
    
    func getTopPlayers() -> PlayerListRows {
        return  .topPlayerCell(TopPlayersCellViewModel(from: players))
    }
    
    private func notifyPlayerListupdate(_ players: [Player]) {
        state.send(.success(mapPlayerToPlayerListRows(players)))
    }
    
    private func mapPlayerToPlayerListRows(_ players: [Player]) -> [PlayerListRows] {
        players.map(
            {
                PlayerListRows.playersInfo(PlayerInfoCellViewModel(from: $0))
            }
        )
    }
}
