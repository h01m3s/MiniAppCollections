//
//  AttributeCell.swift
//  MultipleCellTypes
//
//  Created by Weijie Lin on 3/19/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class AttributeCell: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: Attribute? {
        didSet {
            titleLabel.text = item?.key
            valueLabel.text = item?.value
        }
    }
    
    override func setupView() {
        super.setupView()
        
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        valueLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 0, height: 60)
    }
    
}
