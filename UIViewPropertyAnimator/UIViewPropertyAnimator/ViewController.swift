//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by Weijie Lin on 11/2/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "bp"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCenteredImageView()
        setupSlider()
    }
    
    fileprivate func setupSlider() {
        let slider = UISlider()
        view.addSubview(slider)
        slider.anchor(top: imageView.bottomAnchor, leading: imageView.leadingAnchor, bottom: nil, trailing: imageView.trailingAnchor)
    }
    
    fileprivate func setupCenteredImageView() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }

}

