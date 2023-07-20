//
//  PlayerListViewController.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit
import Combine

class PlayerListViewController: UIViewController {

    private let selection = PassthroughSubject<String, Never>()
    private let search = PassthroughSubject<String, Never>()
    private var cancellables: [AnyCancellable] = []
    private let viewModel: PlayerListViewModel
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var errorText: UILabel!
    
    
    
    init(viewModel: PlayerListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        viewModel.setupBindings(selection: selection, search: search)
            .sink {[unowned self] state in
                render(for: state)
            }
            .store(in: &cancellables)
    }
    
    private func render(for state: PlayerListingViewState) {
        errorText.isHidden =  true
        activityIndicator.isHidden = true
        switch state {
        case .loading:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            
        case .failed:
            errorText.isHidden = false
            errorText.text = "Encountered an Error"
        case .success(let array):
            print(array)
        case .noIteamsFoundOnSearch:
            errorText.isHidden = false
            errorText.text = "No items matching for search query found"
        }
    }
    
   


    @IBAction func handleTestButton() {
        
        search.send("")
    }

}
