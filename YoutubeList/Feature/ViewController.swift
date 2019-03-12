//
//  ViewController.swift
//  YoutubeList
//
//  Created by r.f.kumar.mishra on 12/03/19.
//  Copyright © 2019 r.f.kumar.mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let cellIdentifier = "tableViewReload"
    @IBOutlet weak var videoTableView: UITableView!
    private var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getVideoList()

        viewModel.onVideoListUpdate = { () in            
            DispatchQueue.main.async { [weak self] in
                self?.videoTableView.reloadData()
            }
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getVideos()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.title(at: indexPath)
        return cell
    }
}
