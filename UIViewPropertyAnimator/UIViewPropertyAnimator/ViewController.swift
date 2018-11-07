//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by Weijie Lin on 11/2/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bp"))
        view.addSubview(imageView)
//        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        imageView.center = view.center
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }

}

