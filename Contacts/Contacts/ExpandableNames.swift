//
//  ExpandableNames.swift
//  Contacts
//
//  Created by Weijie Lin on 2/5/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import Foundation
import Contacts

struct ExpandableNames {
    
    var isExpanded: Bool
    var names: [FavoritableContact]
    
}

struct FavoritableContact {
    let contact: CNContact
    var hasFavorited: Bool
}
