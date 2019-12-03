//
//  HistoryView.swift
//  CalculatorSwiftUI
//
//  Created by h01m3s on 12/2/19.
//  Copyright © 2019 h01m3s. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack{
            if model.totalCount == 0 {
                Text("No History Found.")
            } else {
                HStack {
                    Text("History").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("Output").font(.headline)
                    Text("\(model.brain.output)")
                }
                
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1
                )
            }
        }.padding()
    }
    
}
