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
    @State var loggedin: [User]
    
    
    var body: some View {
        TabView(selection: $tabSelection) {
            MainView()
                .tag(1)
//              
            
            Search(allUsers: users)
                .tag(2)
            
           favorites()
                .tag(3)
            
            Profile(allUsers: users, logedin: loggedin)
                .tag(4)
        }
        
        .overlay(alignment: .bottom) {
            Tabbar(tabSelection: $tabSelection)
        }
        
     
    }
}

#Preview {
    Home(users: [], loggedin: [])
}

