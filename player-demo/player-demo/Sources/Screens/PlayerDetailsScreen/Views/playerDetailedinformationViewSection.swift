//
//  playerDetailedinformationViewSection.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

// MARK: - playerDetailedinformationViewSection
struct playerDetailedinformationViewSection: View {
    
    var discription: String?
    var information: [Indicator]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            if let discription = discription {
                Text(discription)
                  .font(
                    Font.custom("SF Pro", size: 15)
                      .weight(.light)
                  )
                  .foregroundColor(Color("Grey08"))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.bottom, 16)
            }
            ForEach(Array(information.enumerated()), id: \.offset) { index, element in
                playerDetailedinformationViewCell(title: "\(element.key):", info: element.value)
                if index != information.count - 1 {
                    playerDetailedinformationViewCellSeperator()
                }
            }
        }
        .padding(8)
        .background(Color(red: 0.97, green: 0.98, blue: 0.98))
        .cornerRadius(12)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.5)
            .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 1)
        )
    }
}

// MARK: - playerDetailedinformationSectionTitle
struct playerDetailedinformationSectionTitle: View {
    
    var title: String
    
    var body: some View {
        Text(title)
          .font(
            Font.custom("SF Pro", size: 28)
              .weight(.light)
          )
          .foregroundColor(Color("Primery mid"))
    }
}

fileprivate struct playerDetailedinformationViewCellSeperator: View {
    var body: some View {
        Color("Grey01")
          .frame(height: 1)
          .padding(.leading, 1)
          .padding(.trailing, 1)
    }
}

fileprivate struct playerDetailedinformationViewCell: View {
    
    var title: String
    var info: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text(title)
              .font(
                Font.custom("SF Pro", size: 15)
                  .weight(.semibold)
              )
              .foregroundColor(Color("Grey03"))
              .frame(alignment: .leading)
              .padding(.leading, 8)
            Spacer()
            Text(info)
              .font(Font.custom("SF Pro", size: 15))
              .multilineTextAlignment(.trailing)
              .foregroundColor(.black)
              .frame( alignment: .trailing)
              .padding(.trailing, 8)
        }
    }
}
