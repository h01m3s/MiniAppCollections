//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by Weijie Lin on 10/30/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = Theme.accent
    }
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
    }
    
}
