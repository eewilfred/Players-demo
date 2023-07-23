//
//  TopPlayerCollectionViewCell.swift
//  player-demo
//
//  Created by edwin wilson on 21/07/2023.
//

import UIKit
import Combine

class TopPlayerCollectionViewCell: UICollectionViewCell {
    
    var viewModel: PlayerInfoCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet private weak var teamLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet private weak var bgView: UIView!
    
    private var cancellable: AnyCancellable?
    
    // Can be moved to a base class if more was there in project
    static let identifier = "TopPlayerCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.addCorenerRadius(raduis: 18, sides: [.topLeft, .topRight])
        bgView.addCorenerRadius(raduis: 8, sides: [.bottomLeft, .bottomRight])
        playerImageView.addCorenerRadius(raduis: 18, sides: [.topLeft, .topRight])
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
    
    override func prepareForReuse() {
        teamLabel.text = ""
        nameLabel.text = ""
        playerImageView.image = UIImage(systemName: "person")
        //        cancellable?.cancel()
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else {
            return
        }
        teamLabel.text = viewModel.clubName
        nameLabel.text = viewModel.name
        if let image = viewModel.useCases.getSavedImage(from: viewModel.photo) {
            playerImageView.image = image
            
        } else {
            cancellable = viewModel.useCases.loadImage(from: viewModel.photo)
                .sink { [weak self] image in
                    guard let self = self else { return }
                    playerImageView.image = image
                }
        }
    }
}
