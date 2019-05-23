//
//  ViewController.swift
//  VariadicArgs
//
//  Created by Weijie Lin on 5/22/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

class CardView: UIView {}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate UI Elements
        let profileIconImageView = UIImageView()
        let flameIconImageView = UIView()
        let messagesIconImageView = UIView()
        let topCardView = CardView()
        let nextCardView = CardView()
        
        // Add to subview hierarchy
        
        // STANDARD
        view.addSubview(profileIconImageView)
        view.addSubview(flameIconImageView)
        view.addSubview(messagesIconImageView)
        view.addSubview(topCardView)
        view.addSubview(nextCardView)
        
        // VARIADIC ARGS
        view.addSubviews(profileIconImageView, flameIconImageView, messagesIconImageView, topCardView, nextCardView)
    }


}

