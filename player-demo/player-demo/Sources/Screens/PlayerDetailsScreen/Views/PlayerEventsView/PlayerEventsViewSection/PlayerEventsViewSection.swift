//
//  PlayerEventsViewSection.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerEventsViewSection: View {
    
    var model: PlayerEventSectionViewModel
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 4) {
            PlayerEventsViewSectionHeader(logurl: model.leagueLogo, teamName: model.leagueName)
            ForEach(Array(zip(model.matches.indices, model.matches)), id: \.0) { index, item in
                PlayerEventViewcell(
                    model: PlayerEventViewcellViewModel(
                        match: item
                    )
                )
            }
        }
        .padding(8)
        .frame(alignment: .topLeading)
        .background(Color("Grey0"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Color("Grey01"), lineWidth: 1)
        )
    }
}

fileprivate struct PlayerEventsViewSectionHeader: View {
    
    var logurl: String
    var teamName: String
    
    var body: some View {
        HStack(spacing: 10) {
            asyncImage(url: logurl, width: 18, height: 18)
                .padding(4)
            Text(teamName)
                .font(
                    Font.custom("SF Pro", size: 15)
                        .weight(.semibold)
                )
                .foregroundColor(.white)
        }
        .padding(4)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(
            LinearGradient(
                stops: [
                    // AS per Figma this color is not defined but present. This is not a healthy way to do things as it impacts maintainability of code
                    Gradient.Stop(color: Color(red: 0.95, green: 0.25, blue: 0.3), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.87, green: 0.15, blue: 0.23), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)
            )
        )
        .cornerRadius(8)
    }
}
