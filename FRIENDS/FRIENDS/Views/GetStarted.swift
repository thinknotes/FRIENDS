//
//  GetStarted.swift
//  FRIENDS
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct GetStarted: View {
    
    @State  var allUsers: [User] = [
        User(fristName: "Mark", lastNane: "Green", userName: "markgreen221", password: "life", city: "Santa Cruz"),
        User(fristName: "John", lastNane: "Wilkson", userName: "johnwilkson", password: "2223", city: "New York"),
        User(fristName: "Emily Green", lastNane: "Green", userName: "emaily@Green", email: "emilygreen@gmail.com", password: "356", city: "Seattle"),
        User(fristName: "Michael", lastNane: "Smith", userName: "MSmith", email: "smith@icould.com", city: "Las Vegas"),
        
        User(fristName: "Jessica", lastNane: "Martinez", userName: "Jessica2450", email: "jessmartinez@", city: "Santa Fe"),
        
        User(fristName: "Christopher", lastNane: "Brown", userName: "Chrisisamazing", email: "chris22@gmail.com",  city: "Chicago"),
        
        User(fristName: "Amanda", lastNane: "Davis", userName: "Panda44", email: "amandadavis@icloud.com",  city: "San Franscisco")
    ]
    
    @State private var loggedin: [User] = []
    
    @State var isLog: Bool = false
    
    var body: some View {

        NavigationStack {
            VStack {
                
                    
                    Text("FRIENDS")
                        .font(.custom("Assistant-ExtraBold", size: 25))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
                        .bold()
                        .offset(y: -70)
                        .foregroundColor(.white)
                    
                    
                    
                    Text("Find Your Next BFF")
                        .font(.custom("Assistant-Regular", size: 40))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
                        .offset(y: -230)
                    
                    Text("Discover people near you")
                        .font(.custom("Assistant-Regular", size: 20))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
                        .offset(y: -400)
                    
                    
                    VStack {
                        NavigationLink(destination: {
                            NewAccount(users: $allUsers).navigationBarBackButtonHidden(true)
                        }, label: {
                            Text("Get Started")
                                .frame(width: 200, height: 30)
                                .font(.custom("Assistant-Regular", size: 25))
                                .padding()
                                .background(Capsule().fill(.white))
                                .foregroundColor(.blue)
                        })
                        .padding()
//
                     
                        
                        NavigationLink(destination: {
                            Login(allUsers: allUsers, loggedin: loggedin).navigationBarBackButtonHidden(true)
                            
                            
                        }, label: {
                            Text("Already have an account?")
                                .font(.custom("Assistant-SemiBold", size: 15))
                                .foregroundColor(.white)
                        })
                       
                       
                    }
                    
                }
            .background(LinearGradient(gradient: Gradient(colors: [Color("blue4"), Color("blue"), Color("blue3"), Color("blue4") ]), startPoint: .leading, endPoint: .top))
            
            
            
             
            
            
        }
       
        
       
        
        
        
    }
}

#Preview {
    GetStarted()
}


