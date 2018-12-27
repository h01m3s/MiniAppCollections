//
//  HeaderView.swift
//  StretchyHeader
//
//  Created by Weijie Lin on 12/23/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "stretchy_header"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
