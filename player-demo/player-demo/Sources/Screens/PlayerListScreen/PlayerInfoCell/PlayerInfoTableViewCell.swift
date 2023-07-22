//
//  PlayerInfoTableViewCell.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit

class PlayerInfoTableViewCell: UITableViewCell {

    var playerInfoViewModel: PlayerInfoCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet private weak var customBgView: UIView!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet private weak var playerNameLabel: UILabel!
    @IBOutlet private weak var playerInfoLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var topSpacing: NSLayoutConstraint!
    
    var isFirstCell = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadows()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateUI() {
        
        topSpacing.constant = isFirstCell ? 8 : 4
        playerImageView.image = #imageLiteral(resourceName: "home.svg")
        playerNameLabel.text = playerInfoViewModel?.name
        playerInfoLabel.attributedText = playerInfoViewModel?.playerINfoAttributedText
        ratingLabel.text = playerInfoViewModel?.rating
    }
    
    private func addShadows() {
        
        customBgView.layer.borderWidth = 1.0
        customBgView.layer.borderColor = UIColor.clear.cgColor
        customBgView.layer.masksToBounds = false

        
        customBgView.layer.shadowColor = UIColor.gray.cgColor
        customBgView.layer.shadowOffset = CGSize(width: 12, height:2)
        customBgView.layer.shadowRadius = 10
        customBgView.layer.shadowOpacity = 0.3
        customBgView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius:8).cgPath
        customBgView.layer.shouldRasterize = true
        customBgView.layer.rasterizationScale = UIScreen.main.scale
    }
}
