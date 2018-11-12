//
//  UIButtonExtension.swift
//  Itinerary
//
//  Created by Weijie Lin on 11/11/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

extension UIButton {
    
    func createFloatingActionButton() {
        backgroundColor = Theme.Tint
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
}
