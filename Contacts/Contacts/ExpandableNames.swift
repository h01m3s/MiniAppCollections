//
//  ExpandableNames.swift
//  Contacts
//
//  Created by Weijie Lin on 2/5/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import Foundation

struct ExpandableNames {
    
    var isExpanded: Bool
    var names: [Contact]
    
}

struct Contact {
    let name: String
    var hasFavorited: Bool
}
