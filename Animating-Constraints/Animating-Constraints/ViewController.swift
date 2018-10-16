//
//  ViewController.swift
//  Animating-Constraints
//
//  Created by Weijie Lin on 10/15/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var logoImageView: UIImageView!
    @IBOutlet private var logoTopConstraint: NSLayoutConstraint!
    
    @IBOutlet private var animateButtonWidthConstraint: NSLayoutConstraint!
    
    var startButton = StartButton()
    var startButtonCenterYConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStartButtonConstraints()
    }
    
    func setStartButtonConstraints() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 150).isActive = true
        
        startButtonCenterYConstraint = startButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: -300)
        startButtonCenterYConstraint.isActive = true
    }
    
    func animateStartButtonCenter() {
        startButtonCenterYConstraint.constant = view.center.x
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 4, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (complete) in
            if complete {
                self.animateLogoTop()
            }
        })
    }
    
    func animateLogoTop() {
        logoTopConstraint.constant = 50
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    func shrinkAnimateButton() {
        animateButtonWidthConstraint.constant = 100
        UIView.animate(withDuration: 0.4, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 4, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (complete) in
            if complete {
                self.restoreDefaultUI()
            }
        })
    }
    
    func restoreDefaultUI() {
        startButtonCenterYConstraint = startButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: -300)
        logoTopConstraint.constant = 200
        animateButtonWidthConstraint.constant = 300
        UIView.animate(withDuration: 0.4, delay: 2, usingSpringWithDamping: 0.6, initialSpringVelocity: 4, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func animateButtonTapped(_ sender: UIButton) {
        print("Animate")
        animateStartButtonCenter()
        shrinkAnimateButton()
    }
    

}

