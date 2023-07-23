//
//  PlayerEventViewcell.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

struct PlayerEventViewcell: View {
    
    var model: PlayerEventViewcellViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            
            //Data and Round
            VStack(alignment: .center, spacing: 4) {
                Text(model.date)
                    .FontSFPro(13, .medium, Color("Primery"))
                  .multilineTextAlignment(.trailing)
                HStack(alignment: .center, spacing: 4) {
                    Text("Round")
                        .FontSFPro(13, .medium, Color("Grey03"))
                    VStack(alignment: .center, spacing: 10) {
                        Text(model.round)
                            .FontSFPro(15, .semibold, Color("Grey Dark"))
                          .padding(4)
                    }
                    .padding(2)
                    .frame(minWidth: 26, minHeight: 26, alignment: .center)
                    .overlay(
                      RoundedRectangle(cornerRadius: 4)
                        .inset(by: 0.5)
                        .stroke(Color("Primary Light"))
                    )
                }
                .padding(0)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(height: 56, alignment: .center)
            
            //Teams and scores
            getTeamAndScoreView(
                homeTeam: model.homeName,
                homeScore: model.homeScore,
                awayTeam: model.awayName,
                awayScore: model.awayScore
            )
            
            Spacer()
        }
        .padding(0)
        .frame(alignment: .center)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 2, y: 2)
    }
    
    @ViewBuilder func getTeamAndScoreView(homeTeam: String, homeScore: String, awayTeam: String, awayScore: String) -> some View {
        HStack {
            VStack {
                getScoreCardFor(homeTeam, homeScore)
                getScoreCardFor(awayTeam, awayScore, true)
            }
        }
    }
    
    @ViewBuilder func getScoreCardFor(_ team: String, _ score: String, _ isAway: Bool = false) -> some View {
        HStack(spacing: 10) {
            Text(team)
                .FontSFPro(15, .light, Color("Grey08"))
              .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(score)
                .FontSFPro(15, .bold, Color.black)
            HStack(alignment: .center, spacing: 10) {
                // SemiBold 10
                Text(isAway ? "Away" : "Home")
                    .FontSFPro(10, .semibold, Color("Grey08"))
            }
            .padding(.horizontal, 4)
            .padding(.vertical, 2)
            .frame(width: 40, alignment: .center)
            .background(Color("Grey01"))
            .cornerRadius(4)
        }
    }
}
