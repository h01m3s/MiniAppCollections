//
//  StartButton.swift
//  Animating-Constraints
//
//  Created by Weijie Lin on 10/15/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class StartButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        // #40739e
        backgroundColor = UIColor(red: 56/255, green: 173/255, blue: 169/255, alpha: 1)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        setTitle("START", for: .normal)
        setTitleColor(.white, for: .normal)
    }
    
}
