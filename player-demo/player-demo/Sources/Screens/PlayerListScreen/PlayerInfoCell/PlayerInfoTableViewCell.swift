//
//  PlayerInfoTableViewCell.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import UIKit
import Combine

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
        
    @IBOutlet weak var rightMarginTopSpace: NSLayoutConstraint!
    @IBOutlet weak var leftMarginTopSpace: NSLayoutConstraint!
    
    var isFirstCell = false
    
    private var cancalable: AnyCancellable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadows()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        topSpacing.constant = 4
        playerImageView.image = UIImage(systemName: "person")
        playerNameLabel.text = nil
        playerInfoLabel.attributedText = nil
        ratingLabel.text = nil
    }
    
    private func updateUI() {
        
        topSpacing.constant = isFirstCell ? 8 : 4
        playerNameLabel.text = playerInfoViewModel?.name
        playerInfoLabel.attributedText = playerInfoViewModel?.playerINfoAttributedText
        ratingLabel.text = playerInfoViewModel?.rating
        
        if let viewModel = playerInfoViewModel,
           let image = viewModel.useCases.getSavedImage(from: viewModel.photo) {
            playerImageView.image = image
        } else {
            cancalable = playerInfoViewModel?.useCases.loadImage(from: playerInfoViewModel?.photo)
                .sink(receiveValue: { [weak self] image in
                    self?.playerImageView.image = image
                })
        }
        
        
        if isFirstCell {
            rightMarginTopSpace.constant = 20
            leftMarginTopSpace.constant = 20
            contentView.addCorenerRadius(raduis: 20, sides: [.topLeft, .topRight])
        }
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
