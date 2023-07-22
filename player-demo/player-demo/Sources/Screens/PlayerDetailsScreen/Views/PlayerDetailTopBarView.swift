//
//  PlayerDetailTopBarView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI

struct PlayerDetailTopBarView: View {
        
    var dismiss: DismissAction
    // NOT implementing search as the Flow is not clear in requirements
    @State var text: String = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Button {
                    dismiss()
            } label: {
                Image("left-md")
                    .tint(.white)
            }
            .padding(.leading, 12)
            
            HStack {
                TextField("Search here", text: $text)
                .padding(.init(top: 4, leading: 16.0, bottom: 4, trailing: 8))
                Spacer()
                Image("search")
                    .padding(.trailing, 8)
            }
            .background(.white)
            .cornerRadius(8)
            
            Button {} label: {
                Image("settings")
                    .tint(.white)
            }
            .frame(width: 34, height:  34)
            
            Button {
                    dismiss()
            } label: {
                Image("home")
                    .tint(.white)
            }
            .frame(width: 34, height:  34)
            .padding(.trailing, 11)
        }
        .padding(.bottom, 16)
        .background(Color("Primery"))
        .frame(alignment: .leading)
    }
}
