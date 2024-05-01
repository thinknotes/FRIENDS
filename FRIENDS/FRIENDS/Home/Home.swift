//
//  Home.swift
//  FRIENDS
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Home: View {
    
    @State private var tabSelection: Int = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            Text("Home")
                .tag(1)
            
            Text("Search")
                .tag(2)
            
            Text("Favorites")
                .tag(3)
        }
        .overlay(alignment: .bottom) {
            Tabbar(tabSelection: $tabSelection)
        }
        
     
    }
}

#Preview {
    Home()
}
