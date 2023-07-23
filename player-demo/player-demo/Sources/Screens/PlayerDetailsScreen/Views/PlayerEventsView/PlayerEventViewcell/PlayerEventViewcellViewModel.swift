//
//  PlayerEventViewcellViewModel.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import Foundation

struct PlayerEventViewcellViewModel {
    
    var date: String = ""
    var round: String = ""
    var awayName: String = ""
    var awayScore: String = ""
    var homeName: String = ""
    var homeScore: String = ""
    
    init( match: Match) {
        
        date = match.date.convertToAppDateFormat() ?? ""
        round = match.round.replacingOccurrences(of: "Round ", with: "")
        awayName = match.awayName
        awayScore = match.awayScore
        homeName = match.homeName
        homeScore = match.homeScore
    }
}
