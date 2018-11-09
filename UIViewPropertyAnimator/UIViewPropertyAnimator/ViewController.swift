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
    let visualEffectView = UIVisualEffectView(effect: nil)
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCenteredImageView()
        setupVisualBlurEffectView()
        setupSlider()
        
        animator.addAnimations {
            // completed animation state
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.visualEffectView.effect = UIBlurEffect(style: .regular)
        }
        
    }
    
    fileprivate func setupVisualBlurEffectView() {
        view.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
    }
    
    fileprivate func setupSlider() {
        let slider = UISlider()
        view.addSubview(slider)
        slider.anchor(top: imageView.bottomAnchor, leading: imageView.leadingAnchor, bottom: nil, trailing: imageView.trailingAnchor)
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
    }
    
    @objc func handleSliderChange(slider: UISlider) {
        print(slider.value)
        animator.fractionComplete = CGFloat(slider.value)
    }
    
    fileprivate func setupCenteredImageView() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }

}

