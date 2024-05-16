//
//  FRIENDSApp.swift
//  FRIENDS
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

@main
struct FRIENDSApp: App {
    
    
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
  
    var body: some Scene {
        WindowGroup {
            if isLog == true {
                Home(users: allUsers, loggedin: loggedin)
            } else {
                GetStarted()
            }
//            Home(users: allUsers, loggedin: loggedin)
        }
    }
}
