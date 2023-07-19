//
//  Players.swift
//  player-demo
//
//  Created by edwin wilson on 19/07/2023.
//

import Foundation

// MARK: - Players
struct Players: Codable {
    let status: Int
    let message: String
    let data: [Player]
    let total, perPage: Int

    enum CodingKeys: String, CodingKey {
        case status, message, data, total
        case perPage = "per_page"
    }
}
