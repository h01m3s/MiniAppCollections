//
//  ViewController.swift
//  Contacts
//
//  Created by Weijie Lin on 2/3/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    // Should use Custom Delegation properly instead
    func someMethod(cell: UITableViewCell) {
        // which name is clicking on
        guard let indexPathTapped = tableView.indexPath(for: cell) else { return }
        
        let contact = twoDimensionalArray[indexPathTapped.section].names[indexPathTapped.row]
        print(contact)
        let hasFavorited = contact.hasFavorited
        twoDimensionalArray[indexPathTapped.section].names[indexPathTapped.row].hasFavorited = !hasFavorited
        
        cell.accessoryView?.tintColor = hasFavorited ? UIColor.lightGray : .red
    }

    var twoDimensionalArray = [
        ExpandableNames(isExpanded: true, names: ["Amy", "Bill", "Zack", "Steve", "Jack"].map { Contact(name: $0, hasFavorited: false) }),
        ExpandableNames(isExpanded: true, names: ["Carl", "Chris", "Christina", "Cameron"].map { Contact(name: $0, hasFavorited: false) }),
        ExpandableNames(isExpanded: true, names: ["David", "Dan"].map { Contact(name: $0, hasFavorited: false) }),
        ExpandableNames(isExpanded: true, names: [Contact(name: "Parker", hasFavorited: false)]),
    ]
    
    var showIndexPaths = false
    
    @objc func handleShowIndexPath() {
        print("Reload animation of indexPath")
        
        var indexPathsToReload = [IndexPath]()
        
        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].names.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        
        showIndexPaths = !showIndexPaths
        
        let animationStyle = showIndexPaths ? UITableViewRowAnimation.right : .left
        
        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    @objc func handleOpenClose(button: UIButton) {
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
            button.setTitle("Open", for: .normal)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
            button.setTitle("Close", for: .normal)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !twoDimensionalArray[section].isExpanded {
            return 0
        }
        return twoDimensionalArray[section].names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
        cell.link = self
        let contact = twoDimensionalArray[indexPath.section].names[indexPath.row]
        
        cell.textLabel?.text = contact.name
        
        cell.accessoryView?.tintColor = contact.hasFavorited ? UIColor.red : UIColor.lightGray
        
        if showIndexPaths {
            cell.textLabel?.text = "\(contact.name) Section:\(indexPath.section) Row:\(indexPath.row)"
        }
        
        return cell
    }

}

