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
    @IBOutlet private weak var mainTableView: UITableView!
    @IBOutlet private weak var searchField: UITextField!
    
    private lazy var dataSource = PlayerListDataSource(tableView: mainTableView)
    
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
        configureScreen()
    }
    
    private func configureScreen() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        mainTableView.register(UINib(nibName: "PlayerInfoTableViewCell", bundle: .main), forCellReuseIdentifier: "PlayerInfoTableViewCell")
        mainTableView.register(UINib(nibName: "TopPlayersTableViewCell", bundle: .main), forCellReuseIdentifier: "TopPlayersTableViewCell")
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
        switch state {
        case .loading:
            updateActivityIndicatorVisibility(isHidden: false)
        case .failed:
            showMessage(message: "Encountered an Error")
        case .success(let playerModels):
            mainTableView.isHidden = false
            updateActivityIndicatorVisibility(isHidden: true)
            dataSource.applySnapshot(allPlayers: playerModels, topPlayers: viewModel.getTopPlayers())
        case .noIteamsFoundOnSearch:
            mainTableView.isHidden = true
            showMessage(message: "No items matching for search query found")
        }
    }
    
    private func updateActivityIndicatorVisibility(isHidden: Bool) {
        isHidden ? activityIndicator.stopAnimating() : activityIndicator.startAnimating()
    }
    
    private func showMessage(message: String?) {
        guard let message = message else {
            errorText.isHidden = true
            return
        }
        updateActivityIndicatorVisibility(isHidden: true)
        errorText.isHidden = false
        errorText.text = message
    }
    

    @IBAction func editingEnded(_ sender: UITextField) {
        search.send(sender.text ?? "")
        searchField.resignFirstResponder()
    }
    
    @IBAction func texfieldValuechanged(_ sender: UITextField) {
        search.send(sender.text ?? "")
    }
}


extension PlayerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let playerSection = PlayerListSections.allCases[section]
        switch playerSection {
        case .topPlayers:
            return 41
        case .allPlayers:
            return 41
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let playerSection = PlayerListSections.allCases[section]
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 250, height: 29)
        label.textColor = #colorLiteral(red: 0.9490196078, green: 0.2509803922, blue: 0.3019607843, alpha: 1)
        label.font = UIFont(name: "SFPro-Light", size: 28)
        label.text = playerSection.rawValue
        label.textAlignment = .left
        
        let height = playerSection == .topPlayers ? 41.0 : 41.0
        let bgView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: height)))
        bgView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let topSpace = playerSection == .topPlayers ? 24.0 : 0.0
        let leadingSpace = playerSection == .topPlayers ? 21.0 : 18.0
        label.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: leadingSpace).isActive = true
        label.topAnchor.constraint(equalTo: bgView.topAnchor, constant: topSpace).isActive = true
        return bgView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = dataSource.snapshot().itemIdentifiers(inSection: PlayerListSections.allCases[indexPath.section])[indexPath.row]
        
        switch item {
        case .topPlayerCell(_):
            break
        case .playersInfo(let playerModel):
            selection.send(playerModel.slug)
        }
    }
}


/*
  Note: to add background around sections ina clean way, we need to implement background decoration views with Compositional Layout for UICollection view which will take considerable amount of time and errort to get it working. so i have intenetionaly avoided adding border and color aroung player listing.
 
 Note: Splitting top Players and all Players as two will cause issues for proper scrolling. As for the user experince I took the assumption that when Player listing is scrolled up Top Players needs to be hidden
 
 Note: Back arrow from navigation bar is removed from the design as it serves no purpose in the app.
 */
