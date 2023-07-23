//
//  TopPlayersTableViewCell.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit

class TopPlayersTableViewCell: UITableViewCell {
    
    enum TopPlayerSection: Hashable {
        case players
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!

    private var dataSource: UICollectionViewDiffableDataSource<TopPlayerSection, PlayerInfoCellViewModel>?
    
    var topPlayers: [PlayerInfoCellViewModel]? {
        didSet {
            UpdateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.clipsToBounds = false // TO allow shadows to flow though
        dataSource = UICollectionViewDiffableDataSource<TopPlayerSection, PlayerInfoCellViewModel>(
            collectionView: collectionView
        ) { (collectionView, indexPath, playerModel) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopPlayerCollectionViewCell.identifier, for: indexPath) as! TopPlayerCollectionViewCell
            cell.viewModel = playerModel
            return cell
        }
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "TopPlayerCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: TopPlayerCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func UpdateUI() {
        
        guard let topPlayers = topPlayers else { return }
        var snapshot = NSDiffableDataSourceSnapshot<TopPlayerSection, PlayerInfoCellViewModel>()
        snapshot.appendSections([.players])
        snapshot.appendItems(topPlayers, toSection: .players)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

extension TopPlayersTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
