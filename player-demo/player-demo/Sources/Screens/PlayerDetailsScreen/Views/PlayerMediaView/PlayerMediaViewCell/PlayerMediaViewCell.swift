//
//  PlayerMediaViewCell.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerMediaViewCell: View {
    
    var model: PlayerMediaViewCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 8) {
                asyncImage(url:model.imageUrl, height: 189,contentMode: .fill)
                    .cornerRadius(8)
                
                Text(model.date)
                    .FontSFPro(10, .semibold, Color("Grey07"))
                
                Text(model.title)
                    .FontSFPro(15, .semibold, Color("Grey Dark"))
                  .padding(.trailing, 8)

                Text(model.subTitle)
                    .FontSFPro(13, .medium, Color("Grey07"))
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
            .padding(8)
        }
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
