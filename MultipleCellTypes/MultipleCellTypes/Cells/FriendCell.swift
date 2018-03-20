//
//  FriendCell.swift
//  MultipleCellTypes
//
//  Created by Weijie Lin on 3/19/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class FriendCell: BaseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.image = nil
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: Friend? {
        didSet {
            guard let item = item else { return }
            
            if let pictureUrl = item.pictureUrl {
                pictureImageView.image = UIImage(named: pictureUrl)
            }
            nameLabel.text = item.name
        }
    }
    
    override func setupView() {
        super.setupView()
        
        addSubview(pictureImageView)
        addSubview(nameLabel)
        
        pictureImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 4, paddingLeft: 16, paddingBottom: 4, paddingRight: 0, width: 80, height: 80)
        nameLabel.anchor(top: topAnchor, left: pictureImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 12, paddingBottom: 4, paddingRight: 16, width: 0, height: 0)
    }
    
}
