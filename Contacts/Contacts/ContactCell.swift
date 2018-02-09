//
//  ContactCell.swift
//  Contacts
//
//  Created by Weijie Lin on 2/8/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var link: ViewController?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let startButton = UIButton(type: .system)
        startButton.setImage(#imageLiteral(resourceName: "fav_star"), for: .normal)
        startButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        startButton.tintColor = .red
        startButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = startButton
    }
    
    @objc private func handleMarkAsFavorite() {
        link?.someMethod(cell: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
