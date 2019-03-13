//
//  CustomTableViewCell.swift
//  YoutubeList
//
//  Created by r.f.kumar.mishra on 13/03/19.
//  Copyright © 2019 r.f.kumar.mishra. All rights reserved.
//

import UIKit

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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func updateUI(with video: Video) {
        topImageView.cacheImage(imageUrl: video.thumbnailImageName)
        avatarImage.cacheImage(imageUrl: video.channel.profileImageName)
        titleLabel.text = video.title
        desriptionLabel.text = video.channel.name
    }
}
