//
//  ToDoItem.swift
//  CorrectMVCToDo
//
//  Created by Weijie Lin on 4/13/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import Foundation

struct ToDoItem {
    
    typealias ItemId = UUID
    
    let id: ItemId
    let title: String
    
    init(title: String) {
        self.id = ItemId()
        self.title = title
    }
}

extension ToDoItem: Hashable {
    var hashValue: Int {
        return id.hashValue
    }
}
extension ToDoItem: Equatable {
    public static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.id == rhs.id
    }
}
