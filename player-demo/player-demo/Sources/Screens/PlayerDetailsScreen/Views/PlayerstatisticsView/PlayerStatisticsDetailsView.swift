//
//  PlayerStatisticsDetailsView.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

// MARK: - PlayerStatisticsDetailsView

@MainActor struct PlayerStatisticsDetailsView: View {
    
    var model: PlayerStatisticsDetailsViewModel
    
    var body: some View {
        
        ForEach(model.statistics, id: \.self) { statistic in
            
            if statistic.section == .matches {
                playedMatchStatisticsView(model: statistic)
            } else {
                VStack {
                    playerDetailedinformationSectionTitle(title: statistic.section.rawValue)
                    playerDetailedinformationViewSection(information: statistic.data)
                        .padding(.leading, 13)
                        .padding(.trailing, 13)
                }
            }
        }
    }
}

// MARK: - playedMatchStatisticsView

fileprivate struct playedMatchStatisticsView: View {
    
    var model: PlayerStatisticsDetailsSectionViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center) {
                Text("Matches")
                    .font(
                        Font.custom("SF Pro", size: 15)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                Spacer()
                getcellView(
                    title: model.getIndicatorValueForKey("Total played") ?? "",
                    subtitle: "Total Played"
                )
                getcellView(
                    title: model.getIndicatorValueForKey("Started") ?? "",
                    subtitle: "Started"
                )
                getcellView(
                    title: model.getIndicatorValueForKey("Minutes per game") ?? "",
                    subtitle: "Minutes per game"
                )
            }
            .padding(8)
            .background(.white)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 1, y: 1)
        }
        .padding(8)
        .background(Color("Grey0"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Color("Grey01"), lineWidth: 1)
        )
        .padding(.init(top: 8, leading: 13.0, bottom: 8, trailing: 13))
    }
    
    @ViewBuilder func getcellView(title: String, subtitle: String) -> some View {
        VStack(alignment: .center) {
            Text(title)
                .font(
                    Font.custom("SF Pro", size: 15)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
            Spacer()
            Text(subtitle)
                .font(
                    Font.custom("SF Pro", size: 10)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Grey03"))
                .frame(maxWidth: .infinity, minHeight: 24, maxHeight: 24, alignment: .center)
        }
        .padding(4)
        .frame(width: 57, height: 56, alignment: .center)
        .background(Color("Grey0"))
        .cornerRadius(4)
    }
}
