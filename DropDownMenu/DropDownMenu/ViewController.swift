//
//  ViewController.swift
//  ttest
//
//  Created by Weijie Lin on 2/5/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let clickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Click to Select", for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Item1", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Item2", for: .normal)
        button.backgroundColor = UIColor.yellow
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let thirdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Item3", for: .normal)
        button.backgroundColor = UIColor.red
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttons: [UIButton] = []
    
    @objc func showButtons() {
        print("show buttons")
        buttons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        buttons = [firstButton, secondButton, thirdButton]
        
        clickButton.addTarget(self, action: #selector(showButtons), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(clickButton)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(thirdButton)
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        clickButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

