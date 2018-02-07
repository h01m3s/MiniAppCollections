//
//  BlurPopUpController.swift
//  BlurryPopUp
//
//  Created by Weijie Lin on 2/7/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class BlurPopUpController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Ultron"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let effect = UIBlurEffect(style: .light)
    
    lazy var visualEffectView: UIVisualEffectView = {
        let visualView = UIVisualEffectView(effect: nil)
        visualView.frame = self.view.bounds
        visualView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return visualView
    }()
    
    lazy var addItemView: UIView = {
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        doneButton.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        doneButton.backgroundColor = .yellow
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.layer.cornerRadius = 5
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 2/3, height: 250)
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 5
        view.addSubview(doneButton)
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: view.frame.width * 1/4).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        view.addSubview(visualEffectView)
    }
    
    func animateIn() {
        view.addSubview(addItemView)
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
    
    @objc func handleAdd() {
        animateIn()
    }
    
    @objc func handleDone() {
        animateOut()
    }
    
}
