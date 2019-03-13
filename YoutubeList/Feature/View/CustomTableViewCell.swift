//
//  CustomTableViewCell.swift
//  YoutubeList
//
//  Created by r.f.kumar.mishra on 13/03/19.
//  Copyright © 2019 r.f.kumar.mishra. All rights reserved.
//

import UIKit

/**
 This class represents a customized tableview cell
 */
class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    static let nibName = "CustomTableViewCell"
    
    var model: Video? {
        didSet {
            guard let video = model else { return }
            updateUI(with: video)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    /**
     update cell UI
     - Parameters: video type
     */
    private func updateUI(with video: Video) {
        topImageView.cacheImage(imageUrl: video.thumbnailImageName)
        avatarImage.cacheImage(imageUrl: video.channel.profileImageName)
        titleLabel.text = video.title
        desriptionLabel.text = video.channel.name
    }
}
