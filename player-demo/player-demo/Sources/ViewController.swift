//
//  ViewController.swift
//  player-demo
//
//  Created by edwin wilson on 19/07/2023.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private let useCase =  PlayerListingUseCase(networkService: NetworkService())
    private var cancellables: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TODO: Network Test.. to be removed in next commit.
        useCase.getAllPlayers()
            .sink { result in
            let x = try? result.get()
        }
        .store(in: &cancellables)
        
        useCase.getPlayerDetail(slug: "nathan-redmond")
            .sink { result in
                let y = try? result.get()
            }
            .store(in: &cancellables)
    }


}

