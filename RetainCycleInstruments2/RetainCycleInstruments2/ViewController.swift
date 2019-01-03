//
//  ViewController.swift
//  RetainCycleInstruments2
//
//  Created by Weijie Lin on 1/2/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
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
    
    static let shared = Service()
    
    func fetchData(completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "https://www.google.com") else { return }
        URLSession.shared.dataTask(with: url) { (_, _, _) in
            completion(nil)
        }
    }
    
}

class RedController: UITableViewController {
    
    deinit {
        print("OS reclaiming memory for RedController - NO Retain Cycle/Leak!")
    }
    
    var refreshTableViewClosure: ((Data?, Error?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        
        // Create Notification center retain cycle with closure
        
        Service.shared.fetchData { [weak self] (err) in
            if let err = err {
                print(err)
                return
            }
            self?.showAlert()
        }
        
//        refreshTableViewClosure = { [weak self] (data, err) in
//            self?.showAlert()
//        }
        
        // NotificationCenter has "strong reference" of RedController
        // from self.showAlert()
        // use [weak self] to fix it
        // self should be optional chaining after use [weak self]
        // Or use [unowned self] to fix
        // don't need optional chaining if use [unowned self]
        // Use [unowned self] if gurantee self will never be nil
//        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "someNotificationName"), object: nil, queue: .main) { (notification) in
//
//            self.showAlert()
        
            // Solution 1:
//            [weak self] (notification) in
//            self?.showAlert()
            // Solution 2:
//            [unowned self] (notification) in
//            self.showal
//        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Alert", message: "Message!!!", preferredStyle: .alert)
        present(alertController, animated: true)
    }
    
}

