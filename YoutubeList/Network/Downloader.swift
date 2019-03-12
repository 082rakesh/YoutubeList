//
//  Downloader.swift
//  YoutubeList
//
//  Created by r.f.kumar.mishra on 12/03/19.
//  Copyright © 2019 r.f.kumar.mishra. All rights reserved.
//


// AIzaSyA33sGFSg4zF6PlDFztEPo0hrENxOJfoSI
import Foundation

public typealias Completion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

class Downloader: NSObject {
    
    public func fetchRequest(completionHandler: @escaping Completion) {
        if let url = URL(string: Constant.baseUrl) {
           let downloadRequest = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            session.dataTask(with: downloadRequest) { (data, urlResponse, error) in
                
                if let responseData = data {
                    completionHandler(responseData, urlResponse, nil)
                } else {
                    completionHandler(nil, nil, error)
                }
            }.resume()
        } else {
            print("invalid url")
        }
    }
    
    /*
     // TODO: Create api for download data
    func downloadData() {
        if let url = URL(string: Constant.baseUrl) {
            let downloadRequest = URLRequest(url: url)
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: OperationQueue.main)
            let downloadTask = session.downloadTask(with: downloadRequest)
            downloadTask.resume()
        } else {
            print("Invalid URL")

        }
    }
 */
}

/*
extension Downloader: URLSessionDownloadDelegate {

    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(downloadTask)
        print("File download succesfully")
    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
        }
    }
}
 */
