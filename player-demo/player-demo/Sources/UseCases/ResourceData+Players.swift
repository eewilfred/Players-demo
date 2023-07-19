//
//  ResourceData+Players.swift
//  player-demo
//
//  Created by edwin wilson on 19/07/2023.
//

import Foundation

extension Resource {

    static func allPlayers() -> Resource<Players> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/players")
        return Resource<Players>(forGetRequest: url)
    }

    static func details(slug: String) -> Resource<PlayerDetailsRoot> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/player/details")
        
        let json = ["slug": slug]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        return Resource<PlayerDetailsRoot>(forPostRequest: url, body: jsonData)
    }
}
