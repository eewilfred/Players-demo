//
//  PlayerInfoGlance.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

//MARK: - PlayerInfoGlance

@MainActor struct PlayerInfoGlance: View {
    
    var model: PlayerInfoGlanceModel
    
    @EnvironmentObject var viewModelEnv: PlayerDetailsViewModel
    
    init(viewModel: PlayerDetailsViewModel) {
        self.model = PlayerInfoGlanceModel(viewModel: viewModel)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            GlanceCell(title: model.age, subTitle: "Age")
            GlanceCell(title: model.marketPrice, subTitle: "Market Price")
            GlanceCell(title: model.number, subTitle: "Number")
            
            VStack(alignment: .center, spacing: 0) {
                Text(model.rating)
                    .FontSFPro(28, .light, Color("Primery"))
                Text("Rating")
                    .FontSFPro(10, .semibold, Color("Grey03"))
            }
            .modifier(GlanceCellStyle())
        }
    }
}

//MARK: - GlanceCell

fileprivate struct GlanceCell: View {
    
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(title)
                .FontSFPro(15, .semibold, Color("Grey Dark"))
            Text(subTitle)
                .FontSFPro(10, .semibold, Color("Grey03"))
        }
        .modifier(GlanceCellStyle())
    }
}

//MARK: - GlanceCellStyle

fileprivate struct GlanceCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(height: 56, alignment: .center)
            .background(Color("Grey0"))
            .cornerRadius(4)
    }
}
