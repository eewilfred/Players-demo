//
//  PlayerDetails.swift
//  player-demo
//
//  Created by edwin wilson on 19/07/2023.
//

import Foundation

// MARK: - PlayerDetailsRoot
struct PlayerDetailsRoot: Codable {
    let status: Int
    let message: String
    let data: PlayerDetails
}

// MARK: - DataClass
struct PlayerDetails: Codable {
    let playerID: String
    let playerPhoto: String
    let playerName, playerCountry: String
    let teamPhoto: String
    let teamName, teamSlug: String
    let indicators, rating: [Indicator]
    let statistics: [Statistic]
    let about: String
    let events: [Event]
    let medias: [Media]

    enum CodingKeys: String, CodingKey {
        case playerID = "player_id"
        case playerPhoto = "player_photo"
        case playerName = "player_name"
        case playerCountry = "player_country"
        case teamPhoto = "team_photo"
        case teamName = "team_name"
        case teamSlug = "team_slug"
        case indicators, rating, statistics, about, events, medias
    }
}

// MARK: - Event
struct Event: Codable {
    let leagueName: String
    let leagueLogo: String
    let leagueSlug: String
    let matches: [Match]

    enum CodingKeys: String, CodingKey {
        case leagueName = "league_name"
        case leagueLogo = "league_logo"
        case leagueSlug = "league_slug"
        case matches
    }
}

// MARK: - Match
struct Match: Codable {
    let date, homeScore, awayScore, homeName: String
    let awayName, slug, round: String

    enum CodingKeys: String, CodingKey {
        case date
        case homeScore = "home_score"
        case awayScore = "away_score"
        case homeName = "home_name"
        case awayName = "away_name"
        case slug, round
    }
}

// MARK: - Indicator
struct Indicator: Codable {
    let key, value: String
}

// MARK: - Media
struct Media: Codable {
    let preview: String
    let video: String
    let title, subtitle, date: String
}

// MARK: - Statistic
struct Statistic: Codable {
    let league: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let section: Section
    let data: [Indicator]
}

enum Section: String, Codable {
    case attacking = "Attacking"
    case cards = "Cards"
    case defending = "Defending"
    case matches = "Matches"
    case otherPerGame = "Other (per game)"
    case passes = "Passes"
}
