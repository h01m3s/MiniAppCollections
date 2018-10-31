//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by Weijie Lin on 10/31/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadowAndRoundedCorners() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
    
}
