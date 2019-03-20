//
//  ViewController.swift
//  SegmentedTableView
//
//  Created by Weijie Lin on 3/20/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Games", "TV Shows", "Devices"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return sc
    }()
    
    @objc fileprivate func handleSegmentChange() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowsToDisplay = games
        case 1:
            rowsToDisplay = tvShows
        default:
            rowsToDisplay = devices
        }
        tableView.reloadData()
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let games = [
        "World Of Warcraft", "Fortnite", "Tetris"
    ]
    
    let tvShows = [
        "Full House", "Dr. Who"
    ]
    
    let devices = ["iMac Pro", "Mac Mini"]
    
    lazy var rowsToDisplay = games

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Segmented Table View"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackView = UIStackView(arrangedSubviews: [
                paddedStackView, tableView
            ])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = rowsToDisplay[indexPath.row]
        return cell
    }

}

