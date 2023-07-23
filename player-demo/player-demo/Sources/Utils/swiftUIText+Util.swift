//
//  swiftUIText+Util.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

// I prefer this over modifiers as this yield more clean code in this senario

extension Text {
    
    func FontSFPro(
        _ size: CGFloat,
        _ weight: Font.Weight,
        _ color: Color
    ) -> Text {
        
        return font(
            Font.system(size: size, weight: weight)
              .weight(weight)
          )
        .foregroundColor(color)
    }
}
