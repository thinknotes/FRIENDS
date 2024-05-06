//
//  Home.swift
//  FRIENDS
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Home: View {
    
    @State private var tabSelection: Int = 1
    @State var users: [User]
    
    var body: some View {
        TabView(selection: $tabSelection) {
            Text("Home")
                .tag(1)
            
            Search(allUsers: users)
                .tag(2)
            
            Text("Favorites")
                .tag(3)
            
            Text("Profile")
                .tag(4)
        }
        .overlay(alignment: .bottom) {
            Tabbar(tabSelection: $tabSelection)
        }
        
     
    }
}

#Preview {
    Home(users: [])
}
