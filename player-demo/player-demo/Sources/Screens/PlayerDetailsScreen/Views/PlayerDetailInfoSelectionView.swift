//
//  PlayerDetailInfoSelectionView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

enum PlayerDetailType: String, CaseIterable {
    case info = "Info"
    case statistics = "Statistics"
    case event = "Event"
    case media = "Media"
    
    var icon: Image {
        switch self {
        case .info:
            return Image("inbox")
        case .statistics:
            return Image("statistic-board")
        case .event:
            return Image("date")
        case .media:
            return Image("play")
        }
    }
}

struct PlayerDetailInfoSelectionView: View {
    
    @Binding var type: PlayerDetailType
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 8) {
                ForEach( PlayerDetailType.allCases, id: \.self) { detailType in
                    PlayerDetailInfoSelectionCell(type: detailType, isSelected: detailType == type)
                        .onTapGesture {
                            type = detailType
                        }
                }
                .padding(.leading, 11)
            }
            .padding(0)
            .frame(alignment: .topLeading)
        }
    }
}

struct PlayerDetailInfoSelectionCell: View {
    
    var type: PlayerDetailType
    var isSelected: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            type.icon
            .frame(width: 20, height: 20)
            Text(type.rawValue)
              .font(
                Font.custom("SF Pro", size: 15)
                  .weight(.semibold)
              )
        }
        .foregroundColor(isSelected ? Color("Primary Light") : Color("Grey Dark"))
        .padding(.horizontal, 16)
        .padding(.vertical, 0)
        .frame(height: 40, alignment: .leading)
        .background(isSelected ?  Color("Primery") : Color("Grey0"))
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 2, y: 2)
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .inset(by: 0.5)
            .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 1)
        )
    }
}

struct PlayerDetailInfoSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        @State var type: PlayerDetailType = .info
        PlayerDetailInfoSelectionView(type: $type)
    }
}
