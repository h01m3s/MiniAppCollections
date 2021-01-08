//
//  ContentView.swift
//  SwiftUITabBar
//
//  Created by h01m3s on 1/8/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    @State var selectedIndex = 0
    @State var shouldShowModal = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowModal, content: {
                        Button(action: {shouldShowModal.toggle()}, label: {
                            Text("Full screen")
                        })
                    })
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        ScrollView{
                            ForEach(0..<50) {
                                Text("\($0)")
                            }
                        }
                            .navigationTitle("First Tab")
                    }
                default:
                    NavigationView {
                        Text("Other")
                    }
                }
  
            }
            
//            Spacer()
            
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        
                        if num == 2 {
                            shouldShowModal.toggle()
                            return
                        }
                        
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.label) : .init(white: 0.8))
                        }
                        
                        Spacer()
                    })
                    
                }
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
