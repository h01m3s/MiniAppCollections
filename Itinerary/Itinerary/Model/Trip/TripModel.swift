//
//  TripModel.swift
//  Itinerary
//
//  Created by Weijie Lin on 10/23/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import Foundation

class TripModel {
    
    var id: String!
    var title: String!
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
}