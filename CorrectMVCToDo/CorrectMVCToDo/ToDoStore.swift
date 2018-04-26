//
//  ToDoStore.swift
//  CorrectMVCToDo
//
//  Created by Weijie Lin on 4/13/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import Foundation

class ToDoStore {
    
    enum ChangeBehavior {
        // Associated Data ([Int])
        case add([Int])
        case remove([Int])
        case reload
    }
    
    static let shared = ToDoStore()
    
    static func diff(original: [ToDoItem], now: [ToDoItem]) -> ChangeBehavior {
        let originalSet = Set(original)
        let nowSet = Set(now)
        
        if originalSet.isSubset(of: nowSet) { // Appended
            let added = nowSet.subtracting(originalSet)
            let indexes = added.compactMap { now.index(of: $0) }
            return .add(indexes)
        } else if (nowSet.isSubset(of: originalSet)) { // Removed
            let removed = originalSet.subtracting(nowSet)
            let indexes = removed.compactMap { original.index(of: $0) }
            return .remove(indexes)
        } else { // Both appended and removed
            return .reload
        }
    }
    
    private var items: [ToDoItem] = [] {
        didSet {
            let behavior = ToDoStore.diff(original: oldValue, now: items)
            NotificationCenter.default.post(
                name: .toDoStoreDidChangedNotification,
                object: self,
                typedUserInfo: [.toDoStoreDidChangedChangeBehaviorKey: behavior]
            )
        }
    }

    private init() {}

    func append(item: ToDoItem) {
        items.append(item)
    }

    func append(newItems: [ToDoItem]) {
        items.append(contentsOf: newItems)
    }

    func remove(item: ToDoItem) {
        guard let index = items.index(of: item) else { return }
        remove(at: index)
    }

    func remove(at index: Int) {
        items.remove(at: index)
    }

    func edit(original: ToDoItem, new: ToDoItem) {
        guard let index = items.index(of: original) else { return }
        items[index] = new
    }

    var count: Int {
        return items.count
    }

    func item(at index: Int) -> ToDoItem {
        return items[index]
    }
}
