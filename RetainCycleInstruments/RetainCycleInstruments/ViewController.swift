//
//  ViewController.swift
//  RetainCycleInstruments
//
//  Created by Weijie Lin on 12/30/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Red", style: .plain, target: self, action: #selector(handleShowRedController))
    }
    
    @objc func handleShowRedController() {
        navigationController?.pushViewController(RedController(), animated: true)
    }


}

class Service {
    
    var redController: RedController?
    
    // use weak to resolve retain cycle
    // all varibles are "strong" in default
//    weak var redController: RedController?
    
}

class RedController: UITableViewController {
    
    deinit {
        print("OS Reclaiming Memory For RedController")
    }
    
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        
        // Retain Cycle Created
        service.redController = self
    }
    
}

