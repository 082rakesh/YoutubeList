//
//  ViewModel.swift
//  YoutubeList
//
//  Created by r.f.kumar.mishra on 12/03/19.
//  Copyright © 2019 r.f.kumar.mishra. All rights reserved.
//

import Foundation

final class ViewModel {
    
    private var videoList =  [Video]()
    var onVideoListUpdate: (() -> Void)?
    
    private func getYouttubeList() {
        Downloader().fetchRequest { [weak self] (data, urlResponse, error) in
            if error == nil {
                if let responseData = data{
                    do {
                        self?.videoList =  try JSONDecoder().decode([Video].self, from: responseData)
                        self?.onVideoListUpdate?()
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Invalid data")
                }
            }
        }
    }
}
extension ViewModel {
    
    func getVideoList() {
        getYouttubeList()
    }

    func getVideos() -> Int {
        return videoList.count
    }
    
    func title(at indexPath: IndexPath) -> String {
        return videoList[indexPath.row].title
    }
    
    func video(at indexPath: IndexPath) -> Video {
        return videoList[indexPath.row]
    }
}
