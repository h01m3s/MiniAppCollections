//
//  ViewController.swift
//  CountAnimation
//
//  Created by Weijie Lin on 6/22/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var startValue = 0
    let endValue = 999

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
        // Create CADisplayLink
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: RunLoop.Mode.default)
    }
    
    @objc func handleUpdate() {
        if startValue <= endValue {
            self.countingLabel.text = "\(startValue)"
            startValue += 1
        }
    }
    
}

