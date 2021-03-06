//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by h01m3s on 11/4/19.
//  Copyright © 2019 h01m3s. All rights reserved.
//

import SwiftUI

let scale: CGFloat = UIScreen.main.bounds.width / 414

struct ContentView: View {
    
//    @State private var brain: CalculatorBrain = .left("0")
    @EnvironmentObject var model: CalculatorModel
    @State private var editingHistory = false
    @State private var showingResult = false
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                
                Spacer()
                
                Button("History: \(model.history.count)") {
                    self.editingHistory = true
                }.sheet(isPresented: self.$editingHistory) {
                    HistoryView(model: self.model, isPresented: self.$editingHistory)
                }
                
                Text(model.brain.output)
                    .font(.system(size: 76))
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 24 * scale)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    // Add alert to copy result
                    .onTapGesture {
                        self.showingResult.toggle()
                    }
                    .alert(isPresented: self.$showingResult) {
                        Alert(title: Text(self.model.historyDetail), message: Text(self.model.brain.output), primaryButton: .default(Text("Copy")) {
                            let pasteBoard = UIPasteboard.general
                            pasteBoard.string = self.model.brain.output
                            }, secondaryButton: .cancel()
                        )
                    }
                    
                
                CalculatorButtonPad()
                    .padding(.bottom)
                
            }
            .scaleEffect(scale)
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
            
//            ContentView().previewDevice("iPhone SE")
        }
        
    }
}

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let foregroundColor: Color
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(foregroundColor)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}

struct CalculatorButtonRow: View {
    
//    @Binding var brain: CalculatorBrain
    @EnvironmentObject var model: CalculatorModel
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        
        HStack {
            
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName, foregroundColor: item.foregroundColor)
                {
                    self.model.apply(item)
                }
            }
            
        }
        
    }
    
}

struct CalculatorButtonPad: View {
    
//    @Binding var brain: CalculatorBrain
//    var model: CalculatorModel
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
        
    }
}
