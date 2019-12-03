//
//  CalculatorModel.swift
//  CalculatorSwiftUI
//
//  Created by h01m3s on 12/2/19.
//  Copyright © 2019 h01m3s. All rights reserved.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    // Compiler will automaically generate objectWillChange if we didn't assign one
    // it will call objectWillChange.send() when @Published value is changed
    
//    let objectWillChange = PassthroughSubject<Void, Never>()
    
//    var brain: CalculatorBrain = .left("0") {
//        willSet { objectWillChange.send() }
//    }
    
    @Published var brain: CalculatorBrain = .left("0")
    @Published var history: [CalculatorButtonItem] = []
    
    var historyDetail: String {
        history.map { $0.title }.joined(separator: " ")
    }
    
    var temporaryKept: [CalculatorButtonItem] = []
    
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of Index.")
        
        let total = history + temporaryKept
        
        history = Array(total[..<index])
        
        temporaryKept = Array(total[index...])
        
        brain = history.reduce(CalculatorBrain.left("0")) {
            result, item in
            result.apply(item: item)
        }
    }
    
}
