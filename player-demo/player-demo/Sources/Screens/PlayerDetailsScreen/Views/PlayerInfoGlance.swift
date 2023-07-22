//
//  PlayerInfoGlance.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

@MainActor struct PlayerInfoGlanceModel {
    
    var age: String = ""
    var marketPrice: String = ""
    var number: String = ""
    var rating: String = ""
    
    init(viewModel: PlayerDetailsViewModel) {
        
        guard let model = viewModel.details else { return }
        self.age = model.indicatorForKey("Age") ?? ""
        self.marketPrice = model.indicatorForKey("Market price") ?? ""
        self.number = model.indicatorForKey("Player number") ?? ""
        self.rating = model.indicatorForKey("Rating") ?? ""
    }
}


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
                // Light 28
                Text(model.rating)
                  .font(
                    Font.custom("SF Pro", size: 28)
                      .weight(.light)
                  )
                  .foregroundColor(Color("Primery"))
                // SemiBold 10
                Text("Rating")
                  .font(
                    Font.custom("SF Pro", size: 10)
                      .weight(.semibold)
                  )
                  .foregroundColor(Color("Grey03"))
            }
            .modifier(GlanceCellStyle())
        }
    }
}

struct GlanceCell: View {
    
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // SemiBold 15
            Text(title)
              .font(
                Font.custom("SF Pro", size: 15)
                  .weight(.semibold)
              )
              .foregroundColor(Color("Grey Dark"))
            // SemiBold 10
            Text(subTitle)
              .font(
                Font.custom("SF Pro", size: 10)
                  .weight(.semibold)
              )
              .foregroundColor(Color("Grey03"))
        }
        .modifier(GlanceCellStyle())
    }
}

struct GlanceCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(height: 56, alignment: .center)
            .background(Color("Grey0"))
            .cornerRadius(4)
    }
}
