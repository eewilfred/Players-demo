//
//  playerDetailedinformationView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

struct playerDetailedinformationView: View {
    
    var body: some View {
        
        LazyVStack(alignment: .center, spacing: 15) {
            // Light 28
            Text("About Player")
              .font(
                Font.custom("SF Pro", size: 28)
                  .weight(.light)
              )
              .foregroundColor(Color(red: 0.87, green: 0.15, blue: 0.23))
            
            
            VStack(alignment: .leading, spacing: 4) {
                // Light 15
                Text("Cristiano Ronaldo dos Santos Aveiro GOIH ComM is a Portuguese professional footballer who plays as a forward for Saudi Professional League club Al Nassr and captains the Portugal national team")
                  .font(
                    Font.custom("SF Pro", size: 15)
                      .weight(.light)
                  )
                  .foregroundColor(Color(red: 0.32, green: 0.32, blue: 0.32))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .top, spacing: 0) {
                    // SemiBold 15
                    Text("Main position:")
                      .font(
                        Font.custom("SF Pro", size: 15)
                          .weight(.semibold)
                      )
                      .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                      .frame(alignment: .leading)
                      .padding(.leading, 8)
                    Spacer()
                    // Regular 15
                    Text("Goalkeeper")
                      .font(Font.custom("SF Pro", size: 15))
                      .multilineTextAlignment(.trailing)
                      .foregroundColor(.black)
                      .frame( alignment: .trailing)
                      .padding(.trailing, 8)
                }
                
//                .padding(.horizontal, 8)
//                .padding(.vertical, 4)
                .frame(alignment: .topLeading)
                .overlay(
                  Rectangle()
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 1)
                )
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
        .padding(.horizontal, 9)
        .padding(.vertical, 8)
    }
}

struct playerDetailedinformationView_Previews: PreviewProvider {
    static var previews: some View {
        playerDetailedinformationView()
    }
}
