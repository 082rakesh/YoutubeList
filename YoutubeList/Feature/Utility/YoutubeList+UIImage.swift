//
//  YoutubeList+UIImage.swift
//  YoutubeList
//
//  Created by r.f.kumar.mishra on 13/03/19.
//  Copyright © 2019 r.f.kumar.mishra. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    /**
     Sets the cached image if available or else downloads the image and caches it for subsequent usage.
     */
    func cacheImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        if let imageForCache = imageCache.object(forKey: imageUrl as NSString) {
            self.image = imageForCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let response = data {
                DispatchQueue.main.async {
                    if let imageToCache = UIImage(data: response) {
                        imageCache.setObject(imageToCache, forKey: imageUrl as NSString)
                        self.image = imageToCache
                    }
                }
            }
        }.resume()
    }
}
