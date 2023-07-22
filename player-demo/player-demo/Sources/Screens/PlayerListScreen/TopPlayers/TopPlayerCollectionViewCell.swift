//
//  TopPlayerCollectionViewCell.swift
//  player-demo
//
//  Created by edwin wilson on 21/07/2023.
//

import UIKit

class TopPlayerCollectionViewCell: UICollectionViewCell {
    
    var playerModel: PlayerInfoCellViewModel? {
        didSet {
            updateUI()
        }
    }

    @IBOutlet private weak var teamLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet private weak var bgView: UIView!
    
    // Can be moved to a base class if more was there in project
    static let identifier = "TopPlayerCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.addCorenerRadius(raduis: 18, sides: [.topLeft, .topRight])
        bgView.addCorenerRadius(raduis: 8, sides: [.bottomLeft, .bottomRight])
        addShadows()
    }
    
    private func addShadows() {
        bgView.layer.borderWidth = 1.0
        bgView.layer.borderColor = UIColor.clear.cgColor
        bgView.layer.masksToBounds = true

        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bgView.bounds, cornerRadius:8).cgPath
        // TO improve perfomance
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func updateUI() {
        teamLabel.text = playerModel?.clubName
        nameLabel.text = playerModel?.name
    }

}
