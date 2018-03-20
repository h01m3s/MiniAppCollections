//
//  ViewController.swift
//  MultipleCellTypes
//
//  Created by Weijie Lin on 3/19/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var tableView: UITableView!
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = viewModel
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(NamePictureCell.self, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
        tableView.register(EmailCell.self, forCellReuseIdentifier: EmailCell.identifier)
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        tableView.register(AttributeCell.self, forCellReuseIdentifier: AttributeCell.identifier)
        return tableView
    }()
    
    fileprivate let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        navigationController?.navigationBar.barTintColor = .white
    }

}

