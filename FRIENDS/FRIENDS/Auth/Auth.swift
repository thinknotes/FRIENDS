//
//  Auth.swift
//  FRIENDS
//
//  Created by StudentAM on 4/26/24.
//

import Foundation
import SwiftUI

extension Login {
    class ViewModel: ObservableObject {
        @AppStorage("AUTH_KEY") var authenticated = false {
            willSet { objectWillChange.send() }
        }
        
        @AppStorage("USER_KEY") var username = ""
        @Published var password = ""
        @Published var invalid: Bool = false
        
        private var sampleUser = ""
        private var samplePassword = ""
        
        init() {
            print("Currently logged on: \(authenticated)")
            print("Current user: \(username)")
           
        }
        
        func runAuthentication() {
            self.password = ""
            
            withAnimation {
                authenticated.toggle()
            }
        }
        
        func authenticate() {
            guard self.username.lowercased() == sampleUser else {
                self.invalid = true
                return
            }
            
            guard self.password.lowercased() == samplePassword else {
                self.invalid = true
                return
            }
            
            runAuthentication()
        }
        
        func logOut() {
            runAuthentication()
        }
        
        func logPressed() {
            print("Button pressed.")
        }
    }
}
