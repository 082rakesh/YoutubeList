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
        
        setupTabelView()
        viewModel.getVideoList()

        viewModel.onVideoListUpdate = { () in            
            DispatchQueue.main.async { [weak self] in
                self?.videoTableView.reloadData()
            }
        }
    }
    
    /**
     Setsup tableview
     */
    private func setupTabelView() {
        videoTableView.estimatedRowHeight = UITableView.automaticDimension
        videoTableView.rowHeight = UITableView.automaticDimension
        
        videoTableView.register(UINib(nibName: CustomTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ViewController.cellIdentifier)
    }
}
// MARK: - Datasource
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getVideos()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        customCell.model = viewModel.video(at: indexPath)
        return customCell
    }
}
