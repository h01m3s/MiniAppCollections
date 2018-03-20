//
//  AboutCell.swift
//  MultipleCellTypes
//
//  Created by Weijie Lin on 3/19/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class AboutCell: BaseCell {
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelAboutItem else {
                return
            }
            aboutLabel.text = item.about
        }
    }
    
    override func setupView() {
        super.setupView()
        
        addSubview(aboutLabel)
        
        aboutLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 16, paddingBottom: 4, paddingRight: 16, width: 0, height: 60)
    }
    
}
