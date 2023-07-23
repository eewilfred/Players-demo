//
//  PlayerInfoCellViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit
import Combine

struct PlayerInfoCellViewModel: Hashable {
    let id = UUID()
    
    var name: String
    var clubName: String
    var positionName: String
    var rating: String
    var photo: String?
    var playerINfoAttributedText: NSAttributedString
    var slug: String
    let useCases: PlayerListingUseCaseProtocol
    
    init(from player: Player, useCases: PlayerListingUseCaseProtocol) {
        
        self.useCases = useCases
        self.name = player.name
        self.clubName = player.teamName
        self.positionName = player.positionName.rawValue
        self.slug = player.slug
        // to avoid unnessary code executions
        if player.rating.count > 4,
           let doubleRateing = Double(player.rating) {
                self.rating = String(format: "%.1f", doubleRateing)
        } else {
            self.rating = player.rating
        }
        
        self.photo = player.photo
        self.playerINfoAttributedText = PlayerInfoCellViewModel.generatePlayerInfoAtributedText(player)
    }
    
    static private func generatePlayerInfoAtributedText(_ player: Player) -> NSAttributedString {
        
        let attibutedString: (String, UIColor) -> NSMutableAttributedString = { (string, color) in
            return NSMutableAttributedString(
                string: string,
                attributes: [.foregroundColor : color]
            )
        }
        let seperator = " | "
        let teamNameAttrStr = attibutedString(player.teamName, #colorLiteral(red: 0.9490196078, green: 0.2509803922, blue: 0.3019607843, alpha: 1))
        let seperatorAttrStr = attibutedString(seperator, #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1))
        teamNameAttrStr.append(seperatorAttrStr)
        let postitionAttrStr = attibutedString(player.positionName.rawValue, #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1))
        teamNameAttrStr.append(postitionAttrStr)
        
        teamNameAttrStr.addAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize:12)],
            range: NSRange(location: 0, length: teamNameAttrStr.string.count)
        )
        return teamNameAttrStr
    }
    
    static func == (lhs: PlayerInfoCellViewModel, rhs: PlayerInfoCellViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
    }
}
