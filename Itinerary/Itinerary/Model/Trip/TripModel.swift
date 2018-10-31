//
//  TripModel.swift
//  Itinerary
//
//  Created by Weijie Lin on 10/23/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import Foundation

class TripModel {
    
    let id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
