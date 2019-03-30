//
//  GreenCallButtonCell.swift
//  NumPad
//
//  Created by Weijie Lin on 3/28/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

class GreenCallButtonCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "phone"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
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
