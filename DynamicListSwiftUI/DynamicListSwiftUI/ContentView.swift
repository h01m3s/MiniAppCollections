//
//  ContentView.swift
//  DynamicListSwiftUI
//
//  Created by Weijie Lin on 6/9/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let userName, message, imageName: String
}

struct ContentView : View {
    
    let users: [User] = [
        .init(userName: "Hulk1", message: "Smash Smash Smash", imageName: "hk"),
        .init(userName: "Hulk2", message: "Smash Smash Smash", imageName: "hk"),
        .init(userName: "Hulk3", message: "Smash Smash Smash... Smash Smash Smash... Smash Smash Smash... Smash Smash Smash... Smash Smash Smash... ", imageName: "hk")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.largeTitle)
                ForEach(users) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow : View {
    let user: User
    
    var body: some View {
        HStack{
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            VStack (alignment: .leading) {
                Text(user.userName)
                    .font(.headline)
                Text(user.message)
                    .font(.subheadline)
                    .lineLimit(nil)
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
