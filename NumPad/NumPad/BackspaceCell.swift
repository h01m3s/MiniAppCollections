//
//  BackspaceCell.swift
//  NumPad
//
//  Created by Weijie Lin on 3/30/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

class BackspaceCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "phone_backspace"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 40, height: 40))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
