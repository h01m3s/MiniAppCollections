//
//  CalculatorButtonItem.swift
//  CalculatorSwiftUI
//
//  Created by h01m3s on 11/4/19.
//  Copyright © 2019 h01m3s. All rights reserved.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "✕"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    
    case op(Op)
    case command(Command)
    
}

extension CalculatorButtonItem {
    
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    
    var size: CGSize {
        return CGSize(width: 88, height: 88)
    }
    
}
