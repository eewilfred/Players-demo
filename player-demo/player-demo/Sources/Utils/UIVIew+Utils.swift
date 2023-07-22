//
//  UIVIew+Utils.swift
//  player-demo
//
//  Created by edwin wilson on 21/07/2023.
//

import UIKit

extension UIView {
    
    enum CornerSide {
        
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
        
        var cornermask: CACornerMask {
            switch self {
            case .topLeft:
                return .layerMinXMinYCorner
            case .topRight:
                return .layerMaxXMinYCorner
            case .bottomLeft:
                return .layerMinXMaxYCorner
            case .bottomRight:
                return .layerMaxXMaxYCorner
            }
        }
    }
    
    func addCorenerRadius(raduis: CGFloat, sides: [CornerSide]) {
        self.layer.cornerRadius = raduis
        
        var masks = CACornerMask()
        sides.forEach { side in
            masks.insert(side.cornermask)
        }
        self.layer.maskedCorners = masks
    }
}
