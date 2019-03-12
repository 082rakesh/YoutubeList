//
//  Video.swift
//  YoutubeList
//
//  Created by r.f.kumar.mishra on 12/03/19.
//  Copyright © 2019 r.f.kumar.mishra. All rights reserved.
//

import Foundation

typealias Videos = [Video]

struct Video: Decodable {
    let title: String
    let numberOfViews: Int
    let thumbnailImageName: String
    let channel: Channel
    let duration: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case numberOfViews = "number_of_views"
        case thumbnailImageName = "thumbnail_image_name"
        case channel, duration
    }
}

struct Channel: Decodable {
    let name: String
    let profileImageName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImageName = "profile_image_name"
    }
}
