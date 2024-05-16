//
//  favorites.swift
//  FRIENDS
//
//  Created by StudentAM on 5/13/24.
//

import SwiftUI

struct favorites: View {
    
    @State private var hasStarted: Bool = false
    
    var body: some View {
        VStack {
            
            
            
            if hasStarted == true {
                
                
                Spacer()
                
                Text("You Have No Favorites")
                    .font(.custom("Assistant-Bold", size: 25))
                
                Text("Add something to get started")
                    .foregroundColor(.gray)
                    .padding()
                    .font(.custom("Assistant-Medium", size: 19))
                
                Spacer()
                
                Button(action: {
                    hasStarted = true
                }, label: {
                    Text("Add Favorites")
                        .font(.custom("Assistant-Medium", size: 15))
                        .foregroundColor(.white)
                        .padding()
                        .background(Capsule().fill(Color.blue))
                })
                .padding()
                
                Spacer()
            } else {
                Spacer()
                
                Text("Favorites")
                    .font(.custom("Assistant-Bold", size: 35))
                
                Text("Your memories, your way")
                    .foregroundColor(.gray)
                    .padding()
                    .font(.custom("Assistant-Medium", size: 19))
                
                Spacer()
                
                Button(action: {
                    hasStarted = true
                }, label: {
                    Text("Get Started")
                        .font(.custom("Assistant-Medium", size: 15))
                        .foregroundColor(.white)
                        .padding()
                        .background(Capsule().fill(Color.blue))
                })
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    favorites()
}
