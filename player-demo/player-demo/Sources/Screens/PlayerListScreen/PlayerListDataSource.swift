//
//  PlayerListDataSource.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import UIKit
import Combine

//MARK: - PlayerListSections

enum PlayerListSections: String, Hashable, CaseIterable {
    
    case topPlayers = "Top Players"
    case allPlayers = "All Players"
}

//MARK: - PlayerListRows

enum PlayerListRows: Hashable {
    
    case topPlayerCell(TopPlayersCellViewModel)
    case playersInfo(PlayerInfoCellViewModel)
}

//MARK: - PlayerListDataSource

class PlayerListDataSource: UITableViewDiffableDataSource<PlayerListSections, PlayerListRows> {
        
    init(tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, item in
            switch item {
            case .topPlayerCell(let topPlayers):
                let cell = tableView.dequeueReusableCell(withIdentifier: "TopPlayersTableViewCell", for: indexPath) as! TopPlayersTableViewCell
                cell.topPlayers = topPlayers.cellViewModels
                return cell
                
            case .playersInfo(let player):
                let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerInfoTableViewCell", for: indexPath) as! PlayerInfoTableViewCell
                cell.isFirstCell = indexPath.row == 0
                cell.playerInfoViewModel = player
                return cell
                
            }
        }
    }
    
    func applySnapshot(allPlayers: [PlayerListRows], topPlayers: PlayerListRows) {
        var snapshot = NSDiffableDataSourceSnapshot<PlayerListSections, PlayerListRows>()
        snapshot.appendSections(PlayerListSections.allCases)
        snapshot.appendItems([topPlayers], toSection: .topPlayers)
        snapshot.appendItems(allPlayers, toSection: .allPlayers)
        self.apply(snapshot, animatingDifferences: false)
    }
}

