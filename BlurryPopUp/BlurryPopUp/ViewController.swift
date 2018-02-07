//
//  ViewController.swift
//  BlurryPopUp
//
//  Created by Weijie Lin on 2/6/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        addItemView.layer.cornerRadius = 5
    }
    
    func animateIn() {
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        
        addItemView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.addItemView.alpha = 0
            self.visualEffectView.effect = nil
        }) { (_) in
            self.addItemView.removeFromSuperview()
        }
    }

    @IBAction func addItem(_ sender: Any) {
        animateIn()
    }
    
    @IBAction func dismissPopUp(_ sender: Any) {
        animateOut()
    }
    
}

