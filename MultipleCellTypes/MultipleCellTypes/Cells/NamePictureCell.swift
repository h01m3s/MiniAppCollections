//
//  NameAndPictureCell.swift
//  MultipleCellTypes
//
//  Created by Weijie Lin on 3/19/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class NamePictureCell: BaseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.image = nil
        imageView.clipsToBounds = true
        return imageView
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelNamePictureItem else {
                return
            }
            nameLabel.text = item.name
            pictureImageView.image = UIImage(named: item.pictureUrl)
        }
    }
    
    override func setupView() {
        super.setupView()
        
        addSubview(pictureImageView)
        addSubview(nameLabel)
        
        pictureImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 12, paddingBottom: 8, paddingRight: 0, width: 100, height: 100)
        nameLabel.anchor(top: topAnchor, left: pictureImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 12, paddingBottom: 4, paddingRight: 12, width: 0, height: 0)
    }
    
}
