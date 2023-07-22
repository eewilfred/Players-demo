//
//  PlayerDetails+Default.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import Foundation

// To be used as default value with every thing empty.
extension PlayerDetails {
    
    static var `default`: PlayerDetails {
        PlayerDetails(
            playerID: "",
            playerPhoto: "",
            playerName: "",
            playerCountry: "",
            teamPhoto: "",
            teamName: "",
            teamSlug: "",
            indicators: [],
            rating: [],
            statistics: [],
            about: "",
            events: [],
            medias: []
        )
    }
}
